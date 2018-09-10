Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzOiC-0008Or-Bb
 for ath10k@lists.infradead.org; Mon, 10 Sep 2018 16:07:05 +0000
Subject: Re: Multiple simultaneous channels on QCA9882
References: <CAKc-1SD6VF8-2O=Od+iDjc2wbB3-rSuXy9J63S8xx2w4GHfi3Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <bc1f526c-91a9-4d1e-50fc-00f5b60774d8@candelatech.com>
Date: Mon, 10 Sep 2018 09:06:36 -0700
MIME-Version: 1.0
In-Reply-To: <CAKc-1SD6VF8-2O=Od+iDjc2wbB3-rSuXy9J63S8xx2w4GHfi3Q@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Fraser Cadger <frasercadger@gmail.com>, ath10k@lists.infradead.org

On 09/10/2018 07:37 AM, Fraser Cadger wrote:
> Hi,
>
> I am using a device based on the Atheros QCA9882 chipset.
>
> I would like to make use of the simultaneous dual-band functionality
> that the device provides. The goal is to have to interfaces with one
> acting as
> an Access Point (wlan0) and the other acting as a client of another AP
> (wlan1). Ideally, both of these interfaces should be operating on
> different channels.

These radios can support both bands, but at any given time, they can be on
only a single channel.  You need multiple radios to run on multiple channels.

Thanks,
Ben

>
> As I have understood it, Atheros/Qualcomm market the QCA9882 as being
> capable of both dual-band and concurrent operation:
> https://www.qualcomm.com/news/releases/2012/02/23/qualcomm-atheros-launches-80211ac-product-ecosystem-provide-end-end-gigabit
>
> I am using v4.1 of the Linux kernel.
>
> Having experienced some difficulties using hostapd and wpa_supplicant,
> I checked the device capabilities using iw. If I am interpreting the
> output below correctly, it is only possible to use 1 channel on both
> interfaces:
>
> valid interface combinations:
>                  * #{ managed, P2P-client } <= 36, #{ P2P-GO } <= 3,
> #{ AP } <= 7, #{ IBSS } <= 1,
>                    total <= 36, #channels <= 1, STA/AP BI must match
>
>
> As I understand it, #channels <=1 indicates that only 1 channel may be
> used at a particular time by all interfaces.
>
> I am wondering if this is a limitation of the driver, or if there has
> been a misunderstanding in the capabilities of the hardware.
>
> Does anyone have experience with this?
>
> Regards,
>
> Fraser
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
