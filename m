Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhK2Y-0005pU-4b
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 15:11:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix pm resume after suspend
References: <1414073150-11593-1-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 23 Oct 2014 18:10:27 +0300
In-Reply-To: <1414073150-11593-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 23 Oct 2014 16:05:49 +0200")
Message-ID: <87siieom8s.fsf@kamboji.qca.qualcomm.com>
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
> not only in case of probe call path.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

This one has non-trivial conflicts. Can you rebase, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
