Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by casper.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1aYZr2-0005rB-8p
 for ath10k@lists.infradead.org; Wed, 24 Feb 2016 13:51:49 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: rename mesh and add abstraction layer
Date: Wed, 24 Feb 2016 13:51:22 +0000
Message-ID: <87k2lui5d7.fsf@kamboji.qca.qualcomm.com>
References: <cover.1454015989.git.poh@qca.qualcomm.com>
In-Reply-To: <cover.1454015989.git.poh@qca.qualcomm.com> (Peter Oh's message
 of "Thu, 28 Jan 2016 13:54:06 -0800")
Content-Language: en-US
Content-ID: <AA440A8C8532184EBD16A4E2BE52B0C1@qualcomm.com>
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
To: "Oh, Peter" <poh@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Peter Oh <poh@qca.qualcomm.com> writes:

> Split Mesh service to 11s Mesh and non-11s Mesh according to
> firmware service bit to help users distinguish 11s Mesh from
> non 11s Mesh.
> And add abstraction layer for vdev subtype to solve subtype mismatch
> and to give flexible compatibility among different firmware revisions.
>
> v2:
>  * Rebased. No code changes.
>
> Peter Oh (4):
>   ath10k: rename Mesh related service names
>   ath10k: update 10.4 WMI service map
>   ath10k: use vif->type and vif->p2p for P2P_GO check
>   ath10k: add abstraction layer for vdev subtype

All applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
