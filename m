Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEwif-0005ex-Vq
 for ath10k@lists.infradead.org; Mon, 30 Sep 2019 14:32:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id v8so11637723wrt.2
 for <ath10k@lists.infradead.org>; Mon, 30 Sep 2019 07:32:08 -0700 (PDT)
Subject: Re: [PATCH] ath10k: Fix offchannel tx failure when no
 ath10k_mac_tx_frm_has_freq
References: <1508284992-3574-1-git-send-email-greearb@candelatech.com>
From: Antonio Quartulli <antonio.quartulli@kaiwoo.ai>
Message-ID: <ba256006-b42b-0dee-4eb7-093da5885341@kaiwoo.ai>
Date: Mon, 30 Sep 2019 16:29:32 +0200
MIME-Version: 1.0
In-Reply-To: <1508284992-3574-1-git-send-email-greearb@candelatech.com>
Content-Language: en-US
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

On 18/10/2017 02:03, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> This bug appears to have been added between 4.0 (which works for us),
> and 4.4, which does not work.
> 
> I think this is because the tx-offchannel logic gets in a loop when
> ath10k_mac_tx_frm_has_freq(ar) is false, so pkt is never actually
> sent to the firmware for transmit.
> 
> This patch fixes the problem on 4.9 for me, and now HS20 clients
> can work again with my firmware.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

I have been struggling to send offchannels mgmt frames since a while, as
I was always getting:

[18099.253732] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3780
[18102.293686] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3780
[18105.333653] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3780
[18108.373712] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3780
[18111.413687] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e36c0
[18114.453726] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3f00
[18117.493773] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e36c0
[18120.533631] ath10k_pci 0000:01:00.0: timed out waiting for offchannel
skb cf0e3f00

After digging through the ath10k patchwork I have found this patch which
touches exactly the code I was trying to debug.

After applying this set of changes, I can confirm that sending
offchannel frames works again like a charm.

I have tested only one fw though: ver 10.4-3.5.3-00057.

It's a bummer that this trivial but critical patch is not yet merged
upstream :-(


Tested-by: Antonio Quartulli <antonio.quartulli@kaiwoo.ai>


-- 
Antonio Quartulli
Kaiwoo.ai

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
