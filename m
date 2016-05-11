Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0aCw-0005Jq-Fc
 for ath10k@lists.infradead.org; Wed, 11 May 2016 19:54:11 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: suppress warnings when getting wmi
 peer_rate_code_listevent
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1462536423-9903-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <542b7f110f0b4c74932b60e9276d8a6b@euamsexm01a.eu.qualcomm.com>
Date: Wed, 11 May 2016 21:53:43 +0200
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> wrote:
> In 10.4, fw sends WMI PEER_RATECODE_LIST_EVENTID after successful
> peer_assoc cmd. As of now this event is not of much use and not
> implemented. Change the debug level and messsage as appropriate
> to suppress "Unknown eventid: 36898".
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, 2 patches applied to ath.git:

36bd39bb0ae8 ath10k: suppress warnings when getting wmi peer_rate_code_list event
ee9ca147c59c ath10k: Fix survey reporting with QCA4019

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9032551/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
