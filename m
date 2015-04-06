Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfD1g-00044r-Sz
 for ath10k@lists.infradead.org; Mon, 06 Apr 2015 19:49:41 +0000
Received: by iebmp1 with SMTP id mp1so29626304ieb.0
 for <ath10k@lists.infradead.org>; Mon, 06 Apr 2015 12:49:19 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Apr 2015 15:49:19 -0400
Message-ID: <CAOt_L393JBszKfVNTaXnM3xdRA=D-WOeaSk9KsnxkxsS49syCw@mail.gmail.com>
Subject: Using ath10k for WiFi capturing non-11ac traffic
From: Amato Carbonara <acarbonara13@gmail.com>
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

Hello,
  I have installed a WiFi adapter with the Qualcomm-Atheros QCA-9880
chipset using the at10k drivers.  I am using this WiFi adapter to
capture WLAN traffic.  The recommended firmware for capturing WiFi
traffic is 10.1.467.2-1 per the website.  See following link:
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/monitor

I have successfully installed the above firmware and have been using
the adapter/driver to capture and decrypt all 802.11ac traffic.
However, I have noticed some strange behavior when trying to decrypt
other types of traffic such as:
  1) 802.11a = not able to decrypt any traffic
  2) 802.11n at 20MHz = able to decrypt only partial traffic
  3) 802.11n at 40MHz = able to decrypt only partial traffic

I have tried using the different "iw" and "iwconfig" commands to set
the frequency and channel bandwidth (for example, iw dev wlan1 set
freq 5180 HT20).  Has anyone else seen this issue of not being able to
decrypt all/some of the WiFi traffic?

Thank you,
Amato

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
