Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpyo-0006c2-F7
 for ath10k@lists.infradead.org; Fri, 07 Mar 2014 08:18:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: do not overwrite max_antenna_gain
References: <1394021433-19376-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 7 Mar 2014 10:17:39 +0200
In-Reply-To: <1394021433-19376-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 5 Mar 2014 13:10:33 +0100")
Message-ID: <878usmpgm4.fsf@kamboji.qca.qualcomm.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> From: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> Seems like we have an old bug, where we incidently overwrites
> the max_antenna_gain we pass to firmware, with zero value.
>
> End of all we are artifically reducing the output power.
>
> This patch removes the excessive assignment on max_antenna_gain,
> which is being provided by regulatory domain, and consequently
> improves the tx power.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
