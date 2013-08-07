Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6yjj-0007YP-J0
 for ath10k@lists.infradead.org; Wed, 07 Aug 2013 08:04:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: setup peer UAPSD flag correctly
References: <1375853036-2418-1-git-send-email-janusz.dziedzic@tieto.com>
 <87li4e6l67.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=pP32Vw6UMvS93cReWr6WHz3p_3d8mn0FNJtSQGvuGJ9w@mail.gmail.com>
Date: Wed, 7 Aug 2013 11:04:19 +0300
In-Reply-To: <CALhHN=pP32Vw6UMvS93cReWr6WHz3p_3d8mn0FNJtSQGvuGJ9w@mail.gmail.com>
 (Janusz Dziedzic's message of "Wed, 7 Aug 2013 09:42:22 +0200")
Message-ID: <87siym53lo.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Setup UAPSD peer/peer rate flags correctly.
> WMI_RC_UAPSD_FLAG is a peer rate capabilities flag
> and should not be set as a peer flag.
>
> BTW this don't fix any known bug yet, just found during UAPSD check.

OK. If a bug has been during a code review and doesn't fix a known
issue, please mention that in the commit log as well.

I added this also to the wiki.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
