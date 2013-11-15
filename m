Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhFN7-00026S-1W
 for ath10k@lists.infradead.org; Fri, 15 Nov 2013 09:07:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: expand the wmi mgmt queue limit to 128
References: <1384416075-13751-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 15 Nov 2013 11:01:50 +0200
In-Reply-To: <1384416075-13751-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 14 Nov 2013 09:01:15 +0100")
Message-ID: <87iovu3uo1.fsf@kamboji.qca.qualcomm.com>
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

> It was obseverd many times the short queue limit can be
> easily exceeded in case of AP multiple BSSID scenarios.
>
> "ath10k: wmi mgmt_tx queue limit reached."
>
> This was leading to TX packets drops.
>
> This patch expands the queue limit to 128. After many stress
> experiments (high traffic and lot of management frames in
> the air) the new value seems to fix the problem on platforms
> with limited resources.
>
> Reported-By: Tomasz Skapski <tomasz.skapski@tieto.com>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
