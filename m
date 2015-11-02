Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0077.outbound.protection.outlook.com ([157.56.112.77]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtDHC-0005R9-5h
 for ath10k@lists.infradead.org; Mon, 02 Nov 2015 11:27:51 +0000
From: Tomi Saarnio <Tomi.Saarnio@ekahau.com>
Subject: Question: ath10k and tcpdump antenna noise information missing
Date: Mon, 2 Nov 2015 11:27:26 +0000
Message-ID: <DB5PR02MB063103DC3F0089F66D588415FE2C0@DB5PR02MB0631.eurprd02.prod.outlook.com>
References: <DB5PR02MB0631EFCD121C0F9F6BAC1C4EFE2C0@DB5PR02MB0631.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB0631EFCD121C0F9F6BAC1C4EFE2C0@DB5PR02MB0631.eurprd02.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, =


I have been trying to figure out how to get the antenna noise information f=
rom the tcpdump.
So far, no luck.

The purpose is to estimate the channel noise level and quality using the an=
tenna signal level
(which is available in the tcpdump already) and the antenna noise level (th=
e missing piece of
the puzzle).

For example:

# tcpdump -ni wlan0 -c 10 2> /dev/null

 [63933.453161] device wlan0 entered promiscuous mode
15:22:43.038447 1.0 Mb/s 2412 MHz[63934.205367] device wlan0 left promiscuo=
us mode
=A011b -60dB signal antenna 0 Beacon (NM-WLAN2) [1.0* 2.0* 5.5* 11.0* 9.0 1=
8.0 36.0 54.0 Mbit] ESS CH: 1, PRIVACY
15:22:43.038853 11.0 Mb/s 2412 MHz 11b -31dB signal antenna 0 Probe Respons=
e (aaaa) [9.0 11.0* 12.0 18.0 24.0 36.0 48.0 54.0 Mbit] CH: 1, PRIVACY
15:22:43.039077 5421223us tsft 11.0 Mb/s 2412 MHz 11b -38dB signal antenna =
0 Acknowledgment RA:00:19:07:c5:58:11
15:22:43.039469 11.0 Mb/s 2412 MHz 11b -31dB signal antenna 0 Probe Respons=
e (bbbb) [9.0 11.0* 12.0 18.0 24.0 36.0 48.0 54.0 Mbit] CH: 1, PRIVACY
15:22:43.039694 5421839us tsft 11.0 Mb/s 2412 MHz 11b -39dB signal antenna =
0 Acknowledgment RA:00:19:07:c5:58:1e
15:22:43.040062 11.0 Mb/s 2412 MHz 11b -31dB signal antenna 0 Beacon (cccc)=
 [9.0 11.0* 12.0 18.0 24.0 36.0 48.0 54.0 Mbit] ESS CH: 1, PRIVACY
15:22:43.040298 5422447us tsft 11.0 Mb/s 2412 MHz 11b -31dB signal antenna =
0 Clear-To-Send RA:00:19:07:c5:58:1e
15:22:43.040580 5421593us tsft 11.0 Mb/s 2412 MHz 11b -31dB signal antenna =
0 CF +QoS Data IV:4d23 Pad 20 KeyID 0
15:22:43.040659 5422747us tsft 5.5 Mb/s 2412 MHz 11b -38dB signal antenna 0=
 Acknowledgment RA:00:19:07:c5:58:1e
15:22:43.043266 5425416us tsft 11.0 Mb/s 2412 MHz 11b -28dB signal antenna =
0 Clear-To-Send RA:00:19:07:c5:58:1e

(Note: it seems that the board didn't enter the promiscous mode, but appare=
ntly the tcpdump
captures data successfully.)

The platform is Gateworks Ventana board with the latest kernel 4 build and =
WLE600VX Ath10k miniPCIe board.
"Linux OpenWrt 4.1.6 #2 SMP Thu Oct 29 15:18:59 EET 2015 armv7l GNU/Linux"
 The ath10k firmware version is firmware-2.bin_10.1.467.2-1, but I have als=
o tried firmware-5.bin_10.2.4.70.10-2.

Questions:

- Does the current athk10k firmware and/or driver support the antenna noise=
 information?
- If the current driver doesn't support the feature yet, any plans when it =
would be available?
- If the current driver does provide the missing information, how can I get=
 it to the tcpdump capture?
- Is there any other ways of obtaining the same information by not=A0using =
tcpdump?

Any pointers and suggestions greatly appreciated.

Best regards,
Tomi Saarnio

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
