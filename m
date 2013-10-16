Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWMqc-00026R-JL
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 08:52:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: rename WMI_CMD_UNDEFINED
References: <1381823732-10128-1-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 16 Oct 2013 11:52:25 +0300
In-Reply-To: <1381823732-10128-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 15 Oct 2013 09:55:31 +0200")
Message-ID: <871u3l8unq.fsf@kamboji.qca.qualcomm.com>
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

> Rename WMI_CMD_UNDEFINED to WMI_CMD_UNSUPPORTED. This is more
> accurate here. Also return -EOPNOTSUPP instead of -EINVAL in
> wmi_cmd_send().
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
