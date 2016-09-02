Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqjv-00030W-7K
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:50:48 +0000
MIME-Version: 1.0
Subject: Re: ath10k: suppress warnings when getting wmi WDS peer event id
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1471433280-15237-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <5063c7d781fc45dc9d5121b71a80f5fc@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:50:19 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> 'WMI_10_4_WDS_PEER_EVENTID' is not yet handled/implemented for WDS mode,
> as of nowsuppress the warning message "Unknown eventid: 36903"
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

03c41cc126c8 ath10k: suppress warnings when getting wmi WDS peer event id

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9285623/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
