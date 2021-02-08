using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Infox.DTO
{
    public class EventDAO
    {
        //change the connection string as per your database connection.
        private static string connectionString = "";
        public EventDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
        }

        //this method retrieves all events within range start-end
        public static List<CalendarEvent> getEvents(DateTime start, DateTime end)
        {
            List<CalendarEvent> events = new List<CalendarEvent>();
            connectionString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;//ConfigurationManager.AppSettings["ConnectionString"];
            try
            {

                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("SELECT  Time_Calender.DayId AS event_id,Time_Calender.StartTime AS event_start, Time_Calender.EndTime AS event_end, Time_Calender.Subject AS description, Time_Calender.DayTypeId  AS all_day, Time_DayTypes.DayType AS title,Time_DayTypes.BackGroundColour AS color,Time_DayTypes.FontColour AS textColor FROM  Time_Calender INNER JOIN Time_DayTypes ON Time_Calender.DayTypeId = Time_DayTypes.DayTypeId WHERE CompanyId=1 AND StartTime>=@start AND EndTime<=@end", con);
                cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = start;
                cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = end;

                using (con)
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        events.Add(new CalendarEvent()
                        {
                            id = Convert.ToInt32(reader["event_id"]),
                            title = Convert.ToString(reader["title"]),
                            description = Convert.ToString(reader["description"]),
                            start = Convert.ToDateTime(reader["event_start"]),
                            end = Convert.ToDateTime(reader["event_end"]),
                            allDay = Convert.ToBoolean(reader["all_day"]),
                            color = Convert.ToString(reader["color"]),
                            textColor = Convert.ToString(reader["textColor"])

                        });
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return events;
            //side note: if you want to show events only related to particular users,
            //if user id of that user is stored in session as Session["userid"]
            //the event table also contains an extra field named 'user_id' to mark the event for that particular user
            //then you can modify the SQL as:
            //SELECT event_id, description, title, event_start, event_end FROM event where user_id=@user_id AND event_start>=@start AND event_end<=@end
            //then add paramter as:cmd.Parameters.AddWithValue("@user_id", HttpContext.Current.Session["userid"]);
        }

        //this method retrieves all events within range start-end
        public static List<CalendarEvent> GetRosterDetailsByRosterGroup(int companyId, int rosterGroupId, DateTime start, DateTime end)
        {

            List<CalendarEvent> events = new List<CalendarEvent>();
            connectionString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;//ConfigurationManager.AppSettings["ConnectionString"];
            try
            {
                string sqlQuery = "SELECT Time_Roster.RosterId AS event_id, Time_Roster.CompanyId, Time_Roster.RosterGroupId, Time_Roster.Year, Time_Roster.Month, " +
             " Time_Roster.Day, Time_Roster.DayTypeId AS all_day, Time_Roster.DateName, Time_Roster.RosterDate, Time_Roster.ShiftId, " +
             " Time_Roster.Posted, Time_Roster.StartTime AS event_start, Time_Roster.EndTime AS event_end, Time_Roster.Subject AS title, Time_ShiftTypes.ShiftCode, " +
             " Time_ShiftTypes.ShiftDescription AS description, Time_DayTypes.DayTypeCode, Time_DayTypes.DayType , Time_DayTypes.BackGroundColour AS color, " +
             " Time_DayTypes.FontColour AS textColor FROM Time_Roster INNER JOIN Time_ShiftTypes ON Time_Roster.DayTypeId = Time_ShiftTypes.ShiftId INNER JOIN Time_DayTypes ON Time_Roster.DayTypeId = Time_DayTypes.DayTypeId" +
             " WHERE CompanyId=@CompanyId AND RosterGroupId=@RosterGroupId AND Time_Roster.StartTime >= @start AND  Time_Roster.EndTime <= @end ";

                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(sqlQuery,con);
                cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = start;
                cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = end;
                cmd.Parameters.AddWithValue("@CompanyId", companyId);
                cmd.Parameters.AddWithValue("@RosterGroupId", rosterGroupId);

                using (con)
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        events.Add(new CalendarEvent()
                        {
                            id = Convert.ToInt32(reader["event_id"]),
                            title = Convert.ToString(reader["title"]),
                            description = Convert.ToString(reader["description"]),
                            start = Convert.ToDateTime(reader["event_start"]),
                            end = Convert.ToDateTime(reader["event_end"]),
                            allDay = Convert.ToBoolean(reader["all_day"]),
                            color = Convert.ToString(reader["color"]),
                            textColor = Convert.ToString(reader["textColor"])

                        });
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return events;


        }

        //this method updates the event title and description
        public static void updateEvent(int id, String title, String description)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UPDATE Event SET title=@title, description=@description WHERE event_id=@event_id", con);
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
            cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = description;
            cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //this method updates the event start and end time ... allDay parameter added for FullCalendar 2.x
        public static void updateEventTime(int id, DateTime start, DateTime end, bool allDay)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("UPDATE Event SET event_start=@event_start, event_end=@event_end, all_day=@all_day WHERE event_id=@event_id", con);
            cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = start;
            cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = end;
            cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;
            cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = allDay;

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //this mehtod deletes event with the id passed in.
        public static void deleteEvent(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DELETE FROM Event WHERE (event_id = @event_id)", con);
            cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //this method adds events to the database
        public static int addEvent(CalendarEvent cevent)
        {
            //add event to the database and return the primary key of the added event row

            //insert
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("INSERT INTO Event(title, description, event_start, event_end, all_day) VALUES(@title, @description, @event_start, @event_end, @all_day)", con);
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = cevent.title;
            cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = cevent.description;
            cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
            cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
            cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = cevent.allDay;

            int key = 0;
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();

                //get primary key of inserted row
                cmd = new SqlCommand("SELECT max(event_id) FROM Event where title=@title AND description=@description AND event_start=@event_start AND event_end=@event_end AND all_day=@all_day", con);
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = cevent.title;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = cevent.description;
                cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
                cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
                cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = cevent.allDay;

                key = (int)cmd.ExecuteScalar();
            }

            return key;
        }
    }

}
