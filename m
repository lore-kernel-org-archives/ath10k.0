Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXpU-0006dL-HP
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:44:44 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/5] ath10k: fix recent checkpatch warnings
Date: Tue, 19 Apr 2016 15:44:21 +0000
Message-ID: <87bn55k3ho.fsf@kamboji.qca.qualcomm.com>
References: <20160413111247.18823.15952.stgit@potku.adurom.net>
In-Reply-To: <20160413111247.18823.15952.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 13 Apr 2016 14:13:08 +0300")
Content-Language: en-US
Content-ID: <D311724F8626D748AD55ACE3257E9921@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> I updated checkpatch and noticed that there are few new warnings.
>
> v2:
>
> * fix tests in patch 3
> * add patch 5 to fix a new warning in mac.c
>
> ---
>
> Kalle Valo (5):
>       ath10k: fix checkpatch warnings related to spaces
>       ath10k: prefer kernel type 'u64' over 'u_int64_t'
>       ath10k: prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
>       ath10k: prefer ether_addr_copy() over memcpy()
>       ath10k: fix parenthesis alignment

Applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
