Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZF41E-0005S1-32
 for ath10k@lists.infradead.org; Tue, 14 Jul 2015 17:29:24 +0000
Received: by oige126 with SMTP id e126so11357664oig.0
 for <ath10k@lists.infradead.org>; Tue, 14 Jul 2015 10:29:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 Jul 2015 14:29:03 -0300
Message-ID: <CAHoN2qHYgiD2=9YGOxk=qBKb1rYAuo-m8js+T-NvGHh6KwsBww@mail.gmail.com>
Subject: Disconnected due to excessive missing ACKs on Ath10k (OpenWRT Chaos
 Chalmer RC2)
From: Fernando S <fsclavo@gmail.com>
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
To: ath10k@lists.infradead.org

I'm having dropouts on my TP-Link Archer C7, 2.4Ghz Wlan runs perfect,
but 5Ghz is unstable (my laptop and my Ipad 4 loss connection after a
couple of minutes, specially on heavy traffic).
Looking on router's log, I found:

Thu Jul 9 20:51:32 2015 daemon.info hostapd: wlan0: STA
01:02:03:04:05:06 IEEE 802.11: disconnected due to excessive missing
ACKs Thu Jul 9 20:52:02 2015 daemon.info hostapd: wlan0: STA
01:02:03:04:05:06 IEEE 802.11: deauthenticated due to inactivity
(timer DEAUTH/REMOVE)


And on client side:

Jul 9 20:51:05 laptop wpa_supplicant[1011]: wlan0:
CTRL-EVENT-DISCONNECTED bssid=30:30:30:30:30:30 reason=7 Jul 9
20:51:05 laptop NetworkManager[861]: <warn> Connection disconnected
(reason 7)
A little search on Google show me some old bugs, apparently resolved
and only on ath9k (2.4Ghz): maybe the same issue is present on ath10k
(5Ghz)?

Please let me know if I can help to debug this issue.

Thanks and regards.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
