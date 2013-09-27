Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPbBd-0002nN-Fl
 for ath10k@lists.infradead.org; Fri, 27 Sep 2013 16:46:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ath10k: implement FW IE support
References: <20130927131812.20789.9941.stgit@localhost6.localdomain6>
Date: Fri, 27 Sep 2013 19:46:07 +0300
In-Reply-To: <20130927131812.20789.9941.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Fri, 27 Sep 2013 16:20:43 +0300")
Message-ID: <87siwqjjqo.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> FW IE format is needed for ath10k automatically detect what features the
> firmware image supports. This is important especially with 10.x firmwares which
> has a different interface.
>
> Please review.
>
> v2:
>
> * added accidentally dropped board file loading (michal)
>
> * check that ATH10K_FW_IE_FW_IMAGE is available, fail otherwise

Forget this, the changes I made are missing here. I'll send v3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
