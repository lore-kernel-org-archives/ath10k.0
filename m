Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHSNs-00067P-IM
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 08:59:13 +0000
Received: from mr2.cc.vt.edu (mr2.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:212:7ed0:359e])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5R8wiYS024424
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 04:58:45 -0400
Received: from mail-lf0-f72.google.com (mail-lf0-f72.google.com
 [209.85.215.72])
 by mr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5R8wdtE021343
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 04:58:44 -0400
Received: by mail-lf0-f72.google.com with SMTP id a2so114320438lfe.0
 for <ath10k@lists.infradead.org>; Mon, 27 Jun 2016 01:58:44 -0700 (PDT)
MIME-Version: 1.0
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Mon, 27 Jun 2016 04:58:38 -0400
Message-ID: <CAFc9h7vWsEyU7V4X0ehzjsmgw=a_hym0SVrF4Gay=5jJTL2VFA@mail.gmail.com>
Subject: Set the primary channel in HT40 mode
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

Hi All,

I have some difficulty in understanding how HT40, HT40- and HT40+
modes work. My objective is to set a particular 20 MHz channel as the
primary channel when channel bonding is enabled. From what I
understand, HT40- means secondary channel is below the primary, while
HT40+ means secondary channel is above the primary channel. I am
particularly dealing with channels 149, 153, 157 and 161.

When I set the channel to say 157, whether I use HT40+ or HT40-, the
primary channel is always set to channel 161. I am inferring this
because when I scan using iwlist scan, my SSID shows on Channel 161.
Does ath10k not set the primary and secondary channel in this manner?

If not, is there a mechanism by which I can explicitly mention which
channel must be primary, and which must be secondary? Also, how is the
primary channel decided for VHT80 mode?

Note: I am using OpenWrt in my AP. So I set the htmode as an option in
the /etc/config/wireless file.

Thanks,
Gaurang.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
