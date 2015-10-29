Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrkwF-00013s-N0
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 11:00:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: remove shadow copy engine descriptors
References: <1445603466-14138-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Thu, 29 Oct 2015 12:59:33 +0200
In-Reply-To: <1445603466-14138-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 23 Oct 2015 18:01:02 +0530")
Message-ID: <87k2q6q6sq.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Below series remove shadow copy of CE descriptors for source ring.
> Removing the shadow copy should reduce d-cache pressure and memory
> usage of the driver.
>
> v2:
>  * Since ce_send is not using shadow, fix send completion as well.
>
> Rajkumar Manoharan (4):
>   ath10k: use local memory instead of shadow descriptor in ce_send
>   ath10k: remove send completion validation in diag read/write
>   ath10k: cleanup copy engine send completion
>   ath10k: remove shadow copy of CE descriptors for source ring

All four applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
