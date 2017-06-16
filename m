Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLl7B-0004aK-KW
 for ath10k@lists.infradead.org; Fri, 16 Jun 2017 06:52:19 +0000
MIME-Version: 1.0
Subject: Re: [v3] ath10k: Define structures for CE ctrl/misc register
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1496739941-18132-1-git-send-email-c_sgarna@qti.qualcomm.com>
References: <1496739941-18132-1-git-send-email-c_sgarna@qti.qualcomm.com>
Message-ID: <5db1646de68e4b9c86763c7a37ba1397@euamsexm01a.eu.qualcomm.com>
Date: Fri, 16 Jun 2017 08:51:49 +0200
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
To: Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com> wrote:

> Define structures for the copy engine ctrl/misc registers,
> that includes CE CMD halt, watermark source, watermark destination,
> host IE ring, source, destination and dmax ring.
> 
> This adds support to avoid the conditional compilation,
> code optimization and dynamic configuration of the copy engine
> register map for respective hardware bus interface.
> 
> Signed-off-by: Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

03a016f8944c ath10k: define structures for CE ctrl/misc register

-- 
https://patchwork.kernel.org/patch/9768317/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
