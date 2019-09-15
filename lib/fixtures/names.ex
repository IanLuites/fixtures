defmodule Fixtures.Names do
  @moduledoc ~S"""
  Name generation.
  """
  use Fixtures.Helper

  @first_male_us ~W(
    Aaron Adam Alan Albert Alexander Andrew Anthony Arthur Austin Benjamin Billy
    Bobby Brandon Brian Bruce Bryan Carl Charles Christian Christopher Craig
    Daniel David Dennis Donald Douglas Dylan Edward Eric Ethan Eugene Frank Gary
    George Gerald Gregory Harold Harry Henry Howard Jack Jacob James Jason
    Jeffrey Jeremy Jerry Jesse Joe John Johnny Jonathan Jordan Jose Joseph
    Joshua Juan Justin Keith Kenneth Kevin Kyle Larry Lawrence Louis Mark
    Matthew Michael Nathan Nicholas Patrick Paul Peter Philip Phillip Ralph
    Randy Raymond Richard Robert Roger Ronald Roy Russell Ryan Samuel Scott Sean
    Stephen Steven Terry Thomas Timothy Tyler Vincent Walter Wayne William
    Willie Zachary
  )

  @first_female_us ~W(
    Alice Amanda Amber Amy Andrea Angela Ann Anna Ashley Barbara Betty Beverly
    Brenda Brittany Carol Carolyn Catherine Cheryl Christina Christine Crystal
    Cynthia Danielle Deborah Debra Denise Diana Diane Donna Doris Dorothy
    Elizabeth Emily Emma Evelyn Frances Gloria Grace Hannah Heather Helen
    Jacqueline Jane Janet Janice Jean Jennifer Jessica Joan Joyce Judith Judy
    Julia Julie Karen Katherine Kathleen Kathryn Kathy Kelly Kimberly Laura
    Lauren Linda Lisa Lori Madison Margaret Maria Marie Marilyn Martha Mary
    Megan Melissa Michelle Mildred Nancy Nicole Olivia Pamela Patricia Rachel
    Rebecca Rose Ruth Samantha Sandra Sara Sarah Sharon Shirley Stephanie Susan
    Tammy Teresa Theresa Tiffany Victoria Virginia
  )

  @sur_us ~W(
    Adams Aguilar Alexander Allen Alvarado Alvarez Andrews Arnold Austin Bailey
    Baker Banks Barnett Barrett Beck Bell Bennett Bishop Black Boyd Bradley
    Brewer Brown Bryant Burke Burns Burton Butler Carlson Carpenter Carr Carroll
    Carter Castillo Castro Chapman Chavez Chen Clark Cole Coleman Collins
    Contreras Cook Cooper Cox Crawford Cruz Cunningham Curtis Daniels Davidson
    Davis Day Dean Delgado Diaz Dixon Douglas Duncan Dunn Ellis Estrada Evans
    Ferguson Fernandez Fisher Flores Ford Foster Fowler Fox Franklin Freeman
    Fuller Gardner Garrett George Gomez Gonzales Gordon Graham Grant Gray Green
    Greene Griffin Guerrero Gutierrez Guzman Hamilton Hansen Hanson Harris
    Harvey Henderson Henry Hernandez Herrera Hicks Hill Hoffman Holland Holmes
    Howard Hudson Hughes Hunt Hunter Jackson James Jenkins Jimenez Johnson Jones
    Keller Kelley Kelly Kennedy Kim King Larson Lawrence Lawson Lee Lewis Long
    Lopez Marshall Martin Martinez Mason Matthews May McCoy McDonald Medina
    Mendez Mendoza Meyer Miller Mills Mitchell Montgomery Moreno Morgan Morris
    Murphy Myers Nelson Nguyen Nichols Obrien Olson Ortiz Palmer Parker Patel
    Patterson Pena Perez Perkins Perry Peters Pierce Powell Price Ramos Ray Reed
    Reid Reyes Reynolds Rice Richardson Riley Rios Rivera Roberts Robertson
    Robinson Rodriguez Rogers Romero Rose Ross Ruiz Russell Salazar Sanders
    Sandoval Santos Schmidt Schneider Schultz Scott Shaw Silva Simmons Smith
    Snyder Soto Spencer Stanley Stephens Stevens Stewart Stone Sullivan Taylor
    Thomas Thompson Torres Tran Turner Valdez Vargas Vasquez Wade Wagner Walker
    Wallace Walsh Ward Warren Watson Weaver Webb Weber Wells West Wheeler White
    Williams Williamson Wong Woods Wright Young
  )

  @honorifics [
    "Admiral",
    "Air Cdre",
    "Air Marshal",
    "Alderman",
    "Ambassador",
    "Archbishop",
    "Archdeacon",
    "Baron of Lewes",
    "Baron",
    "Baroness",
    "Bishop",
    "Brigadier",
    "Brother",
    "Buergermeister",
    "Canon",
    "Captain",
    "Catholic Chaplain",
    "Chairman",
    "Chevalier",
    "Chief Constable",
    "Chief Fire Officer",
    "Chief Inspector",
    "Chief Rabbi Sir",
    "Chief Supt",
    "Chief",
    "Colonel Dr",
    "Colonel",
    "Commander",
    "Commodore",
    "Comte",
    "Consort to the Deputy Mayor of Wirral",
    "Consul",
    "Councillor Mrs",
    "Councillor",
    "Count",
    "Countess",
    "Dame",
    "Dato'",
    "Datuk",
    "Dean",
    "Deputy Mayor of Sefton Councillor",
    "Deputy Vice-Chancellor Professor",
    "District Attorney",
    "District Judge",
    "Doctor",
    "Dott.",
    "Dr",
    "Duchess",
    "Duke",
    "Earl",
    "Emeritus Professor",
    "Eng",
    "Eur Ing",
    "Father",
    "Fiona",
    "Flt Lt",
    "Frau",
    "Frú",
    "General",
    "Governor",
    "Group Captain",
    "Her Excellency",
    "Her Honour Judge",
    "Her Honour",
    "Her Royal Highness Princess",
    "Her Royal Highness",
    "Herr",
    "High Sheriff of Merseyside",
    "His Excellency Chief",
    "His Excellency",
    "His Grace the Duke of Westminster",
    "His Grace The Duke",
    "His Grace",
    "His Honour Judge",
    "His Honour",
    "His Royal Highness Prince",
    "His Royal Highness",
    "Hon. Lord",
    "Hon",
    "Honourable",
    "HRH Princess",
    "Ing",
    "Judge",
    "Justice",
    "Lady Mayoress",
    "Lady",
    "Lieutenant Colonel",
    "Lieutenant Commander",
    "Lieutenant",
    "Lord Lieutenant of Merseyside Dame",
    "Lord Lieutenant of Merseyside Dr",
    "Lord Lieutenant",
    "Lord Mayor",
    "Lord",
    "Lt Cdr",
    "Lt Colonel",
    "Madam",
    "Mademoiselle",
    "Major",
    "Majors",
    "Mar",
    "Marchioness",
    "Master",
    "Mayor",
    "Mayoress",
    "Messrs",
    "Methodist Chaplain",
    "Miss",
    "Mme",
    "Monsieur",
    "Monsignor",
    "Mr and Mrs",
    "Mr Justice",
    "Mr",
    "Mrs",
    "Ms",
    "Mx",
    "of Birkenhead",
    "of Quarry Bank",
    "Pastor",
    "Police Constable",
    "Pr Eng",
    "Prebendary",
    "President",
    "Prince",
    "Princess",
    "Pro-Vice-Chancellor Professor",
    "Pro-Vice-Chancellor",
    "Professor Dame",
    "Professor Lord",
    "Professor Sir",
    "Professor the Lord",
    "Professor",
    "QPM",
    "Rabbi",
    "Revd. Cannon Dr.",
    "Reverend Brother",
    "Reverend Canon",
    "Reverend Dr",
    "Reverend Father",
    "Reverend Professor",
    "Reverend Sister",
    "Reverend",
    "Right Reverend",
    "Rt Hon",
    "Rt. Hon. Dame",
    "Rt. Hon. Lord Justice",
    "Rt. Hon. Sir",
    "Senator",
    "Senior Executive Assistant",
    "Sergent",
    "Sheikh",
    "Sir",
    "Sister",
    "Squadron Leader",
    "Sub Lt",
    "The Countess of",
    "The Duke of",
    "The Earl of",
    "The Editor",
    "The High Sheriff of Merseyside Dr.",
    "The High Sheriff",
    "The Hon Dame",
    "The Hon. Dr.",
    "The Hon. Mr. Justice",
    "The Hon. Mr",
    "The Honorable Dame",
    "The Honorable Mrs",
    "The Honorable Sir",
    "The Honorable",
    "The Lord",
    "The Mayor-Elec of Wirral Councillor",
    "The Mayor",
    "The Most Rev",
    "The Right Hon. Lord Justice",
    "The Right Hon. the Lord",
    "The Right Honourable",
    "The Rt Hon Lady Justice",
    "The Rt Hon Lord",
    "The Rt Hon Mrs",
    "The Rt Hon the Lady",
    "The Rt Hon the Lord",
    "The Rt Hon",
    "The Rt Honourable Earl of",
    "The Rt Rev Bishop",
    "The Rt Rev Dr",
    "The Rt Rev",
    "The Rt. Hon the Lord",
    "The Rt. Hon. Dame",
    "The Rt. Hon. Lady Justice",
    "The Rt. Hon. Lord",
    "The Rt. Hon. The Baroness",
    "The Rt. Hon. the Earl of",
    "The Rt. Hon. The Lady",
    "The Rt. Hon. The Lord",
    "The Rt. Hon.",
    "The Rt. Hon",
    "The Rt. Rev. Dr.",
    "The Rt. Revd. Dr.",
    "The Rt. Worshipful",
    "The Rt. Worshipfull",
    "The Very Revd. Dr.",
    "The Very Reverend",
    "The Worship the Mayor of Wirral",
    "The Worship the Mayor",
    "The Worshipful the Lord Mayor of Liverpool",
    "The Worshipful the Lord Mayor",
    "The Worshipful the Mayor of Halton",
    "The Worshipful the Mayor of Knowsley",
    "The Worshipful the Mayor of Sefton",
    "The Worshipful the Mayor of St. Helens",
    "The Worshipful the Mayor of",
    "The Worshipful the Mayor",
    "Venerable",
    "Very Reverend",
    "Vice Admiral Sir",
    "Vice-Chancellor Professor",
    "Vice-Chancellor",
    "Viscount",
    "Viscountess",
    "Wing Commander"
  ]

  @doc ~S"""
  A random honorific.
  """
  @spec honorific(Keyword.t()) :: String.t()
  def honorific(_opts \\ []), do: Enum.random(@honorifics)

  @doc ~S"""
  A random username.
  """
  @spec username(Keyword.t()) :: String.t()
  def username(opts \\ []) do
    "#{String.capitalize(Fixtures.Colors.color(opts))}#{
      String.capitalize(Fixtures.Text.noun(opts))
    }#{Enum.random(10..99)}"
  end

  @doc ~S"""
  A random first name.

  Possible to pass either `:female` or `:male` as `:sex` to limit
  names to those commonly associated with either sex.
  """
  @spec first_name(Keyword.t()) :: String.t()
  def first_name(opts \\ []) do
    sex =
      case opts[:sex] do
        "male" -> :male
        :male -> :male
        "female" -> :female
        :female -> :female
        _ -> Enum.random(~w(female male)a)
      end

    case sex do
      :female -> Enum.random(@first_female_us)
      :male -> Enum.random(@first_male_us)
    end
  end

  @doc ~S"""
  A random surname.
  """
  @spec surname(Keyword.t()) :: String.t()
  def surname(_opts \\ []), do: Enum.random(@sur_us)

  @doc ~S"""
  A random name including first and surname.

  Possible to pass either `:female` or `:male` as `:sex` to limit
  names to those commonly associated with either sex.
  """
  @spec name(Keyword.t()) :: String.t()
  def name(opts \\ []), do: "#{first_name(opts)} #{surname(opts)}"
end
