Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKHp6-0005qQ-MZ
 for ath10k@lists.infradead.org; Thu, 30 Nov 2017 05:55:50 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: unify rx processing in napi_poll
Date: Thu, 30 Nov 2017 05:55:23 +0000
Message-ID: <b4d1ec9afff447fc92d92645a4273222@NALASEXR01H.na.qualcomm.com>
References: <1511991212-4837-1-git-send-email-rmanohar@qti.qualcomm.com>
 <01899b3e-15c5-4f23-5c3c-86b23a0a9451@bowerswilkins.com>
In-Reply-To: <01899b3e-15c5-4f23-5c3c-86b23a0a9451@bowerswilkins.com>
Content-Language: en-US
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
To: Peter Oh <peter.oh@bowerswilkins.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>

> I'm wondering if this patch is related to kernel crash due to ath10k napi.
> 
> Do you think this patch helps the crash below?
> 
> This crash happened ath10k v4.14 (10/04/2017, commit id c09dbd7) +
> 3.14.43 kernel backports.
> 
> [ 6866.655419] ------------[ cut here ]------------
> [ 6866.659029] kernel BUG at /net/core/dev.c:4301!
> [ 6866.666404] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> [ 6866.672206] Modules linked in: asix essedma qca_ssdk ath9k
>
This change solves WARN_ON_ONCE in napi_poll. 
WARNING: CPU: 0 PID: 7 at ../net/core/dev.c:5274 

Im not sure about BUG_ON that you mentioned. Feel free to verify the change.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
