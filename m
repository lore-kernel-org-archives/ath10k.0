Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk0NR-0002UJ-Vj
 for ath10k@lists.infradead.org; Fri, 31 Oct 2014 00:47:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix pm resume after suspend
References: <1414399436-7047-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 31 Oct 2014 02:47:14 +0200
In-Reply-To: <1414399436-7047-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Mon, 27 Oct 2014 09:43:56 +0100")
Message-ID: <87d299dq0d.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Firmware was crashing when we were trying to warm reset it
> after suspend. This was due to the fact that target registeres
> can be accessed only if the hardware is awaken.
>
> This patch makes sure to awake the device also on the hif up,
> not only in case of probe call.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Unfortunately this still does not apply, most likely because of Michal's
warm reset fixes I just applied. Can you rebase one more time, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
