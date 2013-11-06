Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdyp9-00083K-Is
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 08:50:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH -next] ath10k: fix possible memory leak in
 ath10k_pci_probe()
References: <CAPgLHd9o1oGjjM=9B2H0tB41t8Kinp_1Djp6aA=sW5Eo5M7jfA@mail.gmail.com>
Date: Wed, 6 Nov 2013 10:50:19 +0200
In-Reply-To: <CAPgLHd9o1oGjjM=9B2H0tB41t8Kinp_1Djp6aA=sW5Eo5M7jfA@mail.gmail.com>
 (Wei Yongjun's message of "Wed, 30 Oct 2013 13:24:39 +0800")
Message-ID: <87fvr9ud6c.fsf@kamboji.qca.qualcomm.com>
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
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: yongjun_wei@trendmicro.com.cn, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org

Wei Yongjun <weiyj.lk@gmail.com> writes:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> memory is malloced in ath10k_pci_probe() and should be freed before
> leaving from the error handling cases, otherwise it will cause
> memory leak.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
