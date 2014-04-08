Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWKm-0007pf-I9
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 13:45:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: wifi card disconnected right after assoicated with AP
References: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
Date: Tue, 8 Apr 2014 16:44:22 +0300
In-Reply-To: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 (Nick Shu's message of "Mon, 7 Apr 2014 21:27:40 +0000")
Message-ID: <87ob0ckkax.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Shu, Nick" <Nick.Shu@spirent.com> writes:

> I'm trying to use a wifi card to associate to a access point, but got
> a strange thing here.

What card exactly? And what version of ath10k and the firmware?

> Right after associated with AP, it disconnected from AP, the pattern repeated for:
> Scan
> Authentication
> Association
> De-authenticated
> Dis-associated
> I captured the frames as below, saw a "wlan0 del station <AP's MAC>",
> why wlan0 do this local request?

Very difficult to say based on the information you provided. How do you
exactly control the STA? Using iw, wpa_supplicant, network-manager or
something else?

> 0.096321: wlan0 (phy #0): scan started
> 2.802464: wlan0 (phy #0): scan finished: 2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260
>  5280 5300 5320 5500 5520 5540 5560 5580 5660 5680 5700 5745 5765 5785 5805 5825, ""
> 0.008130: wlan0: new station c4:04:15:29:cd:2e
> 0.000462: wlan0 (phy #0): auth c4:04:15:29:cd:2e -> 00:03:07:12:34:56
> status: 0: Successful [frame: b0 00 3c 00 00 03 07

00:03:07:12:34:56 (the default MAC address) implies that there's a
problem with the calibration data. Please try with firmware
10.1.467.2-1. Do you get a proper MAC address then?

Also It would be good to see both kernel logs as well as wpasupplicant
debug logs. And a sniffer capture would be preferably as well.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
