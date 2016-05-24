Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5GYJ-0005zx-Sy
 for ath10k@lists.infradead.org; Tue, 24 May 2016 17:55:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix legacy rate packet debug messages
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1463474131-26835-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <98b2e947a9ec454cb16e0c26dde6f618@euamsexm01a.eu.qualcomm.com>
Date: Tue, 24 May 2016 19:55:08 +0200
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
> Legacy rate packets may not necessarily be having a rx status
> flag of '0' always, for example management frame have flags
> like RX_FLAG_ONLY_MONITOR / RX_FLAG_MACTIME_END also set
> 
> Just check 'VHT' and 'HT' flags are not set , and simply clasify it as
> legacy rate packets
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath.git:

026441c9d4ff ath10k: fix legacy rate packet debug messages

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9110621/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
