Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBf0A-0008W1-0f
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 12:28:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
 <2172036.sbaLp6LFFn@bentobox> <3062143.B1lnfLpWcE@bentobox>
Date: Wed, 03 Apr 2019 15:28:16 +0300
In-Reply-To: <3062143.B1lnfLpWcE@bentobox> (Sven Eckelmann's message of "Tue, 
 26 Feb 2019 10:23:30 +0100")
Message-ID: <8736mzuvbz.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Steve deRosier <derosier@cal-sierra.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, Ansuel Smith <ansuelsmth@gmail.com>

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 25 February 2019 21:00:38 CET Sven Eckelmann wrote:
> [...]
>> Tested-by: Sven Eckelmann <sven@narfation.org>
>> 
>> Was tested on QCA988X with 10.2.4-1.0-00041
>
> I just wanted to test it with 802.11s setup on IPQ4019 with 10.4-3.5.3-00057 
> and QCA9888 with 10.4-3.5.3-00053 (ath10k-firmware) and 10.4-3.6-00140
> (linux-firmware 2018-12-16-211de167) for both. But it looks like the firmware 
> always crashes with and without this patch and 11s.
>
>     [  221.620803] ath10k_pci 0000:01:00.0: wmi command 36967 timeout, restarting hardware
>     [  221.744056] ieee80211 phy0: Hardware restart was requested
>     [  225.130829] ath10k_pci 0000:01:00.0: failed to receive control response completion, polling..
>     [  226.170824] ath10k_pci 0000:01:00.0: Service connect timeout
>     [  226.170871] ath10k_pci 0000:01:00.0: failed to connect htt (-110)
>     [  226.252248] ath10k_pci 0000:01:00.0: Could not init core: -110
>
> If i count correctly, this is WMI_10_4_GPIO_CONFIG_CMDID. Not really supported 
> by upstream but it looks like there is an Openwrt private patch (not yet
> accepted upstream [1])
>
>   package/kernel/mac80211/patches/ath/974-ath10k_add-LED-and-GPIO-controlling-support-for-various-chipsets.patch 
>
> which I have now removed to fix this problem for me.
>
> The tests with 10.4-3.6-00140 and 10.4-3.5.3-* worked fine without this patch.
>
> @Kalle are you expecting that he resents the patch again or can you just 
> append this information to the commit message? At least it looks at the moment 
> like there will be no new patch in the near future. But the 
> commit cd93b83ad92 ("ath10k: support for multicast rate control") is breaking 
> real world setups.

I'm planning to apply this. I was not sure what you wanted to add to the
commit log but I changed to now what's below. Please let me know if you
want to change it.

    ath10k: fix incorrect multicast/broadcast rate setting
    
    Invalid rate code is sent to firmware when multicast rate value of 0 is
    sent to driver indicating disabled case, causing broken mesh path.
    so fix that.
    
    Tested on QCA9984 with firmware 10.4-3.6.1-00827
    
    Sven tested on IPQ4019 with 10.4-3.5.3-00057 and QCA9888 with 10.4-3.5.3-00053
    (ath10k-firmware) and 10.4-3.6-00140 (linux-firmware 2018-12-16-211de167).
    
    Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")
    Co-developed-by: Zhi Chen <zhichen@codeaurora.org>
    Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
    Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
    Tested-by: Sven Eckelmann <sven@narfation.org>
    Patchwork-Id: 10723033
    Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
