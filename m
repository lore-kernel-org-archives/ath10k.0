Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgBG0-0006Q8-EM
 for ath10k@lists.infradead.org; Thu, 09 Apr 2015 12:08:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Change the fw stats access mask
References: <1427476680-5532-1-git-send-email-yanbol@qca.qualcomm.com>
Date: Thu, 9 Apr 2015 15:08:01 +0300
In-Reply-To: <1427476680-5532-1-git-send-email-yanbol@qca.qualcomm.com> (Yanbo
 Li's message of "Fri, 27 Mar 2015 10:18:00 -0700")
Message-ID: <87vbh5ec7y.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qca.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

Yanbo Li <yanbol@qca.qualcomm.com> writes:

> This fix the regerssion introduced after "ath10k_wmi_requests_stats()
> call to use more stat bits", both the 10.2.X FW and community FW 10.1.X
> will return time out when access the fw_stats with the STAT_VDEV and
> STAT_PDEV. Add the condition to use different fw_stats mask for different
> FW versions.
>
> Fixes:7777d8c7ef6f("ath10k: implement fw stats for wmi-tlv")
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
