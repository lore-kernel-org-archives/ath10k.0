Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aCQKv-0003Qg-RS
 for ath10k@lists.infradead.org; Fri, 25 Dec 2015 11:15:10 +0000
Received: by mail-pf0-x229.google.com with SMTP id 65so35281382pff.3
 for <ath10k@lists.infradead.org>; Fri, 25 Dec 2015 03:14:44 -0800 (PST)
Received: from ankur.sibshivalik.com ([202.131.115.146])
 by smtp.googlemail.com with ESMTPSA id 78sm52786331pfr.41.2015.12.25.03.14.42
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Fri, 25 Dec 2015 03:14:43 -0800 (PST)
Message-ID: <567D251C.1080803@sibridgetech.com>
Date: Fri, 25 Dec 2015 16:44:36 +0530
From: Ankur Saxena <ankur.saxena@sibridgetech.com>
MIME-Version: 1.0
Subject: Queries about ath10k driver and QCA988x based radio from sparklan
Content-Type: multipart/mixed; boundary="------------040801080701090205050609"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This is a multi-part message in MIME format.
--------------040801080701090205050609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

We have purchased radio module "WPEA-352ACN" from SparkLan. We are using 
this radio module with ViaTech board for 802.11 AC functionality. We are 
running linux kernel 3.19.1 with atheros driver ath10k up with all the 
configuration elements.

We are facing some issues in getting up 802.11 AC functionality for the 
radio. Please find below the queries:

1) We are using latest ath10k driver with 802.11AC configuration 
enabled. On loading the driver for ath10k, we are not seeing "802.11AC" 
in iwconfig utility for wlan interface. It is showing only 802.11 abgn 
for the interface.

2) Tried to make AP using the interface by taking help of hostapd 
utility. Searched on internet for configuration related to making 802.11 
AC AP and used them all. In this case, Mode parameter in iwconfig is 
changed to Master which shows AP functionality, but the interface is 
still showing 802.11 abgn supported only.

3) We are using plain text version of regulatory database file (DB.txt) 
which is maintained for use of CRDA. We are making sure that DB.txt file 
is parsed properly and the database is added into MAC driver by parsing 
the database file.

4) While running hostapd with full configuration for 802.11AC AP 
settings, no error is seen for setting up the interface. Channel setting 
is done for Auto-configuration and VHT settings are also applied in the 
configuration file. The interface is not able to get up in 802.11 AC 
mode, instead it is coming up only in 802.11 abgn only.

5) There is one error seen after firmware gets downloaded and starts 
running. The error is as below:
ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
Can this may create this issue to happen also?

Please find attached the DB.txt and hostapd configuration file for 
reference.

Can anyone please help us in getting 802.11 AC mode up and running in 
the radio.


--------------040801080701090205050609
Content-Type: text/plain; charset="utf-8"; name="db.txt"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="db.txt"

# This is the world regulatory domain
country 00:
	(2402 - 2472 @ 40), (20)
	# Channel 12 - 13.
	(2457 - 2482 @ 40), (20), NO-IR
	# Channel 14. Only JP enables this and for 802.11b only
	(2474 - 2494 @ 20), (20), NO-IR, NO-OFDM
	# Channel 36 - 48
	(5170 - 5250 @ 80), (20), NO-IR, AUTO-BW
	# Channel 52 - 64
	(5250 - 5330 @ 80), (20), NO-IR, DFS, AUTO-BW
	# Channel 100 - 144
	(5490 - 5730 @ 160), (20), NO-IR, DFS
	# Channel 149 - 165
	(5735 - 5835 @ 80), (20), NO-IR
	# IEEE 802.11ad (60GHz), channels 1..3
	(57240 - 63720 @ 2160), (0)


country AD:
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20)
	(5250 - 5330 @ 80), (20), DFS
	(5490 - 5710 @ 80), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country AE: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country AF: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source:
# http://pucanguilla.org/Downloads/January2005-Anguilla%20Table%20of%20Allocations.pdf
country AI: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country AL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20.00), AUTO-BW
	(5250 - 5330 @ 80), (20.00), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27.00), DFS

country AM: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (18)
	(5250 - 5330 @ 80), (18), DFS

country AN: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country AR: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country AS: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country AT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country AU:
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5710 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country AW: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country AZ: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (18), AUTO-BW
	(5250 - 5330 @ 80), (18), DFS, AUTO-BW

country BA: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country BB: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (23), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country BD: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5735 - 5835 @ 80), (30)

country BE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country BF: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country BG: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country BH: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20)
	(5250 - 5330 @ 80), (20), DFS
	(5735 - 5835 @ 80), (20)

country BL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country BM: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country BN: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5735 - 5835 @ 80), (20)

country BO: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5250 - 5330 @ 80), (30), DFS
	(5735 - 5835 @ 80), (30)

country BR: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country BS: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://www.bicma.gov.bt/paper/publication/nrrpart4.pdf
country BT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country BY: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country BZ: DFS-JP
	(2402 - 2482 @ 40), (30)
	(5735 - 5835 @ 80), (30)

country CA: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://www.art-rca.org
country CF: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 40), (17)
	(5250 - 5330 @ 40), (24), DFS
	(5490 - 5730 @ 40), (24), DFS
	(5735 - 5835 @ 40), (30)

country CH: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country CI: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country CL: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5735 - 5835 @ 80), (20)

country CN: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (23), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)
	# 60 gHz band channels 1,4: 28dBm, channels 2,3: 44dBm
	# ref: http://www.miit.gov.cn/n11293472/n11505629/n11506593/n11960250/n11960606/n11960700/n12330791.files/n12330790.pdf
	(57240 - 59400 @ 2160), (28)
	(59400 - 63720 @ 2160), (44)
	(63720 - 65880 @ 2160), (28)

country CO: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country CR: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (24), DFS
	(5490 - 5730 @ 80), (24), DFS
	(5735 - 5835 @ 80), (30)

country CX: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country CY: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

# Data from http://www.ctu.eu/164/download/VOR/VOR-12-08-2005-34.pdf
# and http://www.ctu.eu/164/download/VOR/VOR-12-05-2007-6-AN.pdf
# Power at 5250 - 5350 MHz and 5470 - 5725 MHz can be doubled if TPC is
# implemented.
country CZ: DFS-ETSI
	(2400 - 2483.5 @ 40), (100 mW)
	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
	(5470 - 5725 @ 160), (500 mW), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

# Data from "Frequenznutzungsplan" (as published in April 2008), downloaded from
# http://www.bundesnetzagentur.de/cae/servlet/contentblob/38448/publicationFile/2659/Frequenznutzungsplan2008_Id17448pdf.pdf
# For the 5GHz range also see
# http://www.bundesnetzagentur.de/cae/servlet/contentblob/38216/publicationFile/6579/WLAN5GHzVfg7_2010_28042010pdf.pdf
# The values have been reduced by a factor of 2 (3db) for non TPC devices
# (in other words: devices with TPC can use twice the tx power of this table).
# Note that the docs do not require TPC for 5150--5250; the reduction to
# 100mW thus is not strictly required -- however the conservative 100mW
# limit is used here as the non-interference with radar and satellite
# apps relies on the attenuation by the building walls only in the
# absence of DFS; the neighbour countries have 100mW limit here as well.

country DE: DFS-ETSI
	# entries 279004 and 280006
	(2400 - 2483.5 @ 40), (100 mW)
	# entry 303005
	(5150 - 5250 @ 80), (100 mW), NO-OUTDOOR, AUTO-BW
	# entries 304002 and 305002
	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
	# entries 308002, 309001 and 310003
	(5470 - 5725 @ 160), (500 mW), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country DK: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

# Source:
# http://www.ntrcdom.org/index.php?option=com_content&view=category&layout=blog&id=10&Itemid=55
country DM: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country DO: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country DZ: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170.000 - 5250.000 @ 80.000), (23.00), AUTO-BW
	(5250.000 - 5330.000 @ 80.000), (23.00), DFS, AUTO-BW
	(5490.000 - 5670.000 @ 160.000), (23.00), DFS

country EC: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (24), DFS
	(5490 - 5730 @ 80), (24), DFS
	(5735 - 5835 @ 80), (30)

country EE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country EG: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20)
	(5250 - 5330 @ 80), (20), DFS

# Orden IET/787/2013, de 25 de abril, por la que se aprueba
# el cuadro nacional de atribución de frecuencias.
# http://www.boe.es/diario_boe/txt.php?id=BOE-A-2013-4845
#
# more info at "Cuadro nacional de atribución de frecuencias (CNAF)":
# http://www.minetur.gob.es/telecomunicaciones/espectro/paginas/cnaf.aspx

country ES: DFS-ETSI
	(2400 - 2483.5 @ 40), (100 mW)
	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
	(5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
	(5470 - 5725 @ 160), (500 mW), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country ET: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country FI: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country FM: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country FR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country GB: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country GD: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country GE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (18), AUTO-BW
	(5250 - 5330 @ 80), (18), DFS, AUTO-BW
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country GF: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country GH: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country GL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20)
	(5250 - 5330 @ 80), (20), DFS
	(5490 - 5710 @ 80), (27), DFS

country GP: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country GR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country GT: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country GU: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (24), DFS
	(5490 - 5730 @ 80), (24), DFS
	(5735 - 5835 @ 80), (30)

country GY:
	(2402 - 2482 @ 40), (30)
	(5735 - 5835 @ 80), (30)

country HK:
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5710 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country HN: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country HR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country HT: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country HU: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country ID: DFS-JP
	# ref: http://www.postel.go.id/content/ID/regulasi/standardisasi/kepdir/bwa%205,8%20ghz.pdf
	(2402 - 2482 @ 40), (20)
	(5735 - 5815 @ 80), (23)

country IE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country IL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
	(5250 - 5350 @ 80), (200 mW), NO-OUTDOOR, DFS, AUTO-BW

country IN: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5735 - 5835 @ 80), (20)

country IR: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5735 - 5835 @ 80), (30)

country IS: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country IT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country JM: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country JO: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (23)
	(5735 - 5835 @ 80), (23)

country JP: DFS-JP
	(2402 - 2482 @ 40), (20)
	(2474 - 2494 @ 20), (20), NO-OFDM
	(4910 - 4990 @ 40), (23)
	(5030 - 5090 @ 40), (23)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (23), DFS

country KE: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (23)
	(5490 - 5570 @ 80), (30), DFS
	(5735 - 5775 @ 40), (23)

country KH: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source
# http://ntrc.kn/?page_id=7
country KN: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (30), DFS
	(5735 - 5815 @ 80), (30)

country KP: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5630 @ 80), (30), DFS
	(5735 - 5815 @ 80), (30)

country KR: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (30), DFS
	(5735 - 5835 @ 80), (30)

country KW: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW

country KY: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country KZ:
	(2402 - 2482 @ 40), (20)

country LB: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://www.ntrc.org.lc/operational_structures.htm
country LC: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (30), DFS
	(5735 - 5815 @ 80), (30)

country LI: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country LK: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (24), DFS
	(5490 - 5730 @ 80), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://lca.org.ls/images/documents/lesotho_national_frequency_allocation_plan.pdf
country LS: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country LT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country LU: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country LV: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country MA: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW

country MC: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source:
# http://www.cnfr.md/index.php?pag=sec&id=117&l=en
country MD: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source:
# http://www.cept.org/files/1050/Tools%20and%20Services/EFIS%20-%20ECO%20Frequency%20Information%20System/National%20frequency%20tables/Montenegro%20NAFT%20-%202010.pdf
country ME: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country MF: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country MH: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country MK: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country MN: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country MO:
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 40), (23)
	(5250 - 5330 @ 40), (23), DFS
	(5735 - 5835 @ 40), (30)

country MP: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country MQ: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source:
# http://www.are.mr/pdfs/telec_freq_TNAbf_2010.pdf
country MR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country MT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country MU: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country MW: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country MX: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country MY: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country NI: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country NL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), NO-OUTDOOR, AUTO-BW
	(5250 - 5330 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

# Data from http://www.lovdata.no/dokument/SF/forskrift/2012-01-19-77
# Power at 5250 - 5350 MHz, 5470 - 5725 MHz and 5815 – 5850 MHz can
# be doubled if TPC is implemented.
# Up to 2W (or 4W with TPC) is allowed in the 5725 – 5795 MHz band
# which has been merged with 5470 - 5725 MHz to allow wide channels
country NO: DFS-ETSI
	(2400 - 2483.5 @ 40), (100 mW)
	(5150 - 5250 @ 80), (200 mW), AUTO-BW
	(5250 - 5350 @ 80), (100 mW), DFS, AUTO-BW
	(5470 - 5795 @ 160), (500 mW), DFS
	(5815 - 5850 @ 35), (2000 mW), DFS
	(17100 - 17300 @ 200), (100 mW)
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country NP: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5735 - 5835 @ 80), (20)

country NZ: DFS-FCC
	(2402 - 2482 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country OM: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country PA: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country PE: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country PF: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country PG: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country PH: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country PK: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5735 - 5835 @ 80), (30)

country PL: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country PM: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country PR: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country PT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country PW: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country PY: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country QA: DFS-JP
	(2402 - 2482 @ 40), (20)
	(5735 - 5835 @ 80), (30)

country RE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country RO: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)


# Source:
# http://www.ratel.rs/upload/documents/Plan_namene/Plan_namene-sl_glasnik.pdf
country RS: DFS-ETSI
	(2400 - 2483.5 @ 40), (100 mW)
	(5150 - 5350 @ 40), (200 mW), NO-OUTDOOR
	(5470 - 5725 @ 20), (1000 mW), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country RU: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20)
	(5250 - 5330 @ 80), (20), DFS
	(5650 - 5730 @ 80), (30), DFS
	(5735 - 5835 @ 80), (30)

country RW: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country SA: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country SE: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country SG: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country SI: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country SK: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

# Source:
# Regulation N° 2004-005 ART/DG/DRC/D.Rég
country SN: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country SR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country SV: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (23), DFS
	(5735 - 5835 @ 80), (30)

country SY:
	(2402 - 2482 @ 40), (20)

# Source:
# http://www.telecommission.tc/Spectrum-plan20110324-101210.html
country TC: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country TD: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country TG: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 40), (20)
	(5250 - 5330 @ 40), (20), DFS
	(5490 - 5710 @ 40), (27), DFS

country TH: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country TN: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW

country TR: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country TT: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country TW: DFS-JP
	(2402 - 2472 @ 40), (30)
	(5270 - 5330 @ 40), (17), DFS
	(5490 - 5590 @ 80), (30), DFS
	(5650 - 5710 @ 40), (30), DFS
	(5735 - 5835 @ 80), (30)
 
# Source:
# #914 / 06 Sep 2007: http://www.ucrf.gov.ua/uk/doc/nkrz/1196068874
# #1174 / 23 Oct 2008: http://www.nkrz.gov.ua/uk/activities/ruling/1225269361
# (appendix 8)
# Listed 5GHz range is a lowest common denominator for all related
# rules in the referenced laws. Such a range is used because of
# disputable definitions there.
country UA: DFS-ETSI
	(2400 - 2483.5 @ 40), (20), NO-OUTDOOR
	(5150 - 5350 @ 40), (20), NO-OUTDOOR
	(5490 - 5670 @ 80), (20), DFS
	(5735 - 5835 @ 80), (20)
	# 60 gHz band channels 1-4, ref: Etsi En 302 567
	(57000 - 66000 @ 2160), (40)

country UG: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country US: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)
	# 60g band
	# reference: http://cfr.regstoday.com/47cfr15.aspx#47_CFR_15p255
	# channels 1,2,3, EIRP=40dBm(43dBm peak)
	(57240 - 63720 @ 2160), (40)

country UY: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://cemc.uz/article/1976/
country UZ: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW

# Source:
# http://www.ntrc.vc/regulations/Jun_2006_Spectrum_Managment_Regulations.pdf
country VC: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

# Source:
# Official Gazette (Gaceta Oficial) concerning Unlicensed transmitter use
# (10 June 2013)
# http://www.conatel.gob.ve/
country VE: DFS-FCC
	(2402 - 2482 @ 40), (30)
	(5170 - 5250 @ 80), (23), AUTO-BW
	(5250 - 5330 @ 80), (23), DFS, AUTO-BW
	(5735 - 5835 @ 80), (30)

country VI: DFS-FCC
	(2402 - 2472 @ 40), (30)
	(5170 - 5250 @ 80), (24), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country VN: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17)
	(5250 - 5330 @ 80), (24), DFS
	(5490 - 5730 @ 80), (24), DFS
	(5735 - 5835 @ 80), (30)

# Source:
# http://www.trr.vu/attachments/category/130/GURL_for_Short-range_Radiocommunication_Devices2.pdf
country VU: DFS-FCC
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (17), AUTO-BW
	(5250 - 5330 @ 80), (24), DFS, AUTO-BW
	(5490 - 5730 @ 160), (24), DFS
	(5735 - 5835 @ 80), (30)

country WF: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country YE:
	(2402 - 2482 @ 40), (20)

country YT: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country ZA: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS

country ZW: DFS-ETSI
	(2402 - 2482 @ 40), (20)
	(5170 - 5250 @ 80), (20), AUTO-BW
	(5250 - 5330 @ 80), (20), DFS, AUTO-BW
	(5490 - 5710 @ 160), (27), DFS


--------------040801080701090205050609
Content-Type: text/plain; charset=UTF-8;
 name="hostapd_full.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hostapd_full.conf"

### hostapd configuration file
interface=wlan0
driver=nl80211

### IEEE 802.11
ssid=ath10k
hw_mode=a
channel=0
max_num_sta=128
auth_algs=1
disassoc_low_ack=1

### DFS
ieee80211h=1
ieee80211d=1
country_code=CA

### IEEE 802.11n
ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]

### IEEE 802.11ac
ieee80211ac=1
vht_oper_chwidth=1
vht_capab=[VHT80+][MAX-MPDU-11454][RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-STBC-1]
vht_oper_centr_freq_seg0_idx=42

### hostapd event logger configuration
logger_syslog=-1
logger_syslog_level=1
logger_stdout=-1
logger_stdout_level=1

### WMM
wmm_enabled=1
uapsd_advertisement_enabled=1
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
wmm_ac_be_txop_limit=0
wmm_ac_be_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmin=3
wmm_ac_vi_cwmax=4
wmm_ac_vi_txop_limit=94
wmm_ac_vi_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmin=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_txop_limit=47
wmm_ac_vo_acm=0

### TX queue parameters
tx_queue_data3_aifs=7
tx_queue_data3_cwmin=15
tx_queue_data3_cwmax=1023
tx_queue_data3_burst=0
tx_queue_data2_aifs=3
tx_queue_data2_cwmin=15
tx_queue_data2_cwmax=63
tx_queue_data2_burst=0
tx_queue_data1_aifs=1
tx_queue_data1_cwmin=7
tx_queue_data1_cwmax=15
tx_queue_data1_burst=3.0
tx_queue_data0_aifs=1
tx_queue_data0_cwmin=3
tx_queue_data0_cwmax=7
tx_queue_data0_burst=1.5

--------------040801080701090205050609
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--------------040801080701090205050609--
