Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dJKJ6-0004M5-FG
 for ath10k@lists.infradead.org; Fri, 09 Jun 2017 13:50:34 +0000
Subject: Re: [PATCH v2 1/3] ath10k: Use complete VHT chan width for 160MHz
 workaround
References: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <c91d2578-d491-c813-cbfb-f742d04f9417@candelatech.com>
Date: Fri, 9 Jun 2017 06:50:11 -0700
MIME-Version: 1.0
In-Reply-To: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 06/09/2017 04:07 AM, Sven Eckelmann wrote:
> From: Ben Greear <greearb@candelatech.com>
>
> The ath10k firmware doesn't announce its VHT channel width capabilities in
> the vht_cap information from the "service ready event" arguments. The
> driver must therefore check whether the 160MHz short GI bit is set and
> whether the driver still doesn't set the bits for the 160/80+80 MHz
> capabilities.
>
> The two bits for the channel width are a two bit integer and not two
> separate bits which cannot be parsed without the knowledge of the other
> bit. Using IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ (b10..) as a
> mask for this task doesn't make any sense. The correct mask for the VHT
> channel width should be used instead to make this check more readable.

I didn't test them, but a quick review looks good.  Thanks for picking this up!

--Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
