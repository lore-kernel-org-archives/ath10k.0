Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPAnp-0005hA-Kr
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 12:36:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 03/13] ath10k: warn if give WMI command is not supported
References: <1380187792-25626-1-git-send-email-bartosz.markowski@tieto.com>
 <1380187792-25626-4-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 26 Sep 2013 15:35:24 +0300
In-Reply-To: <1380187792-25626-4-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Thu, 26 Sep 2013 11:29:42 +0200")
Message-ID: <87a9izrcab.fsf@kamboji.qca.qualcomm.com>
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

> This will show and make it easier to track the API
> differences in the new AP firmware.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---

[...]

> +	if (cmd_id == WMI_CMD_UNDEFINED) {
> +		ath10k_warn("command not supported by given firmware\n");
> +		return ret;
> +	}

You should print the cmd id in the warning message.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
