Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzNKU-0001nH-3X
 for ath10k@lists.infradead.org; Mon, 10 Sep 2018 14:38:19 +0000
Received: by mail-pf1-x432.google.com with SMTP id i26-v6so10571845pfo.12
 for <ath10k@lists.infradead.org>; Mon, 10 Sep 2018 07:38:05 -0700 (PDT)
MIME-Version: 1.0
From: Fraser Cadger <frasercadger@gmail.com>
Date: Mon, 10 Sep 2018 15:37:53 +0100
Message-ID: <CAKc-1SD6VF8-2O=Od+iDjc2wbB3-rSuXy9J63S8xx2w4GHfi3Q@mail.gmail.com>
Subject: Multiple simultaneous channels on QCA9882
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

Hi,

I am using a device based on the Atheros QCA9882 chipset.

I would like to make use of the simultaneous dual-band functionality
that the device provides. The goal is to have to interfaces with one
acting as
an Access Point (wlan0) and the other acting as a client of another AP
(wlan1). Ideally, both of these interfaces should be operating on
different channels.

As I have understood it, Atheros/Qualcomm market the QCA9882 as being
capable of both dual-band and concurrent operation:
https://www.qualcomm.com/news/releases/2012/02/23/qualcomm-atheros-launches-80211ac-product-ecosystem-provide-end-end-gigabit

I am using v4.1 of the Linux kernel.

Having experienced some difficulties using hostapd and wpa_supplicant,
I checked the device capabilities using iw. If I am interpreting the
output below correctly, it is only possible to use 1 channel on both
interfaces:

valid interface combinations:
                 * #{ managed, P2P-client } <= 36, #{ P2P-GO } <= 3,
#{ AP } <= 7, #{ IBSS } <= 1,
                   total <= 36, #channels <= 1, STA/AP BI must match


As I understand it, #channels <=1 indicates that only 1 channel may be
used at a particular time by all interfaces.

I am wondering if this is a limitation of the driver, or if there has
been a misunderstanding in the capabilities of the hardware.

Does anyone have experience with this?

Regards,

Fraser

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
