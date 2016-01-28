Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOiIp-0002OF-1x
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 08:51:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
Date: Thu, 28 Jan 2016 10:51:08 +0200
In-Reply-To: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Wed, 27 Jan 2016 10:55:53 -0800")
Message-ID: <87vb6ekryb.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Split Mesh service to 11s Mesh and non-11s Mesh according to
> firmware service bit to help users distinguish 11s Mesh from
> non 11s Mesh.
> And add abstraction layer for vdev subtype to solve subtype mismatch
> and to give flexible compatibility among different firmware revisions.
>
> Peter Oh (4):
>   ath10k: rename Mesh related service names
>   ath10k: update 10.4 WMI service map
>   ath10k: use vif->type and vif->p2p for P2P_GO check
>   ath10k: add abstraction layer for vdev subtype

There are conflicts, please rebase.

Applying: ath10k: rename Mesh related service names
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath10k/wmi.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi.h
Auto-merging drivers/net/wireless/ath/ath10k/mac.c
Failed to merge in the changes.
Patch failed at 0001 ath10k: rename Mesh related service names

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
