Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePVWl-0003fE-Jv
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 15:34:37 +0000
MIME-Version: 1.0
Subject: Re: [v3,1/4] ath10k: WMI: modify svc bitmap parsing for wcn3990
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1513002175-2498-2-git-send-email-pillair@qti.qualcomm.com>
References: <1513002175-2498-2-git-send-email-pillair@qti.qualcomm.com>
Message-ID: <12a3a3b39947470aa861362ca4e4dcbe@euamsexm01a.eu.qualcomm.com>
Date: Thu, 14 Dec 2017 16:33:54 +0100
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
To: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@qti.qualcomm.com> wrote:

> Due to the limitation of wmi tlv parsing logic, if there are
> two parameters in a wmi event with same tlv tag, we can get only
> the last value, as it overwrites the prev value of the same tlv tag.
> 
> The service ready event in wcn3990 contains two parameters of the
> same tag UINT32, due to which the svc bitmap is overwritten with the
> DBS support parameter.
> 
> Refactor the service ready event parsing to allow parsing two tlv
> of the same tag UINT32 for wcn3990.
> 
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

4 patches applied to ath-next branch of ath.git, thanks.

229329ff345f ath10k: wmi: modify svc bitmap parsing for wcn3990
1807da49733e ath10k: wmi: add management tx by reference support over wmi
9f2992fea580 ath10k: wmi: get wmi init parameter values from hw params
03a72288c546 ath10k: wmi: add hw params entry for wcn3990

-- 
https://patchwork.kernel.org/patch/10105283/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
