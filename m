Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGojn-0005ZI-Tr
 for ath10k@lists.infradead.org; Mon, 20 Nov 2017 16:16:02 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix data rx for CCMP-256, GCMP and GCMP-256 in raw mode
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1509079154-22759-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1509079154-22759-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <2d6293d2e0f04e98ad0ef1f08f3b7a34@eusanexr01a.eu.qualcomm.com>
Date: Mon, 20 Nov 2017 08:15:31 -0800
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

> Make sure 16-byte mic is removed from the rx data packet
> tail when CCMP-256, GCMP and GCMP-256 ciphers are used
> in raw decap mode. This fixed rx traffic failures in those
> ciphers in raw mode. Split the helper returning crypto
> tail length into two, one to get the ICV length and other
> to get the mic lengh for the cipher to make it clean.
> 
> Fixes: 2ea9f12cefe4 ("ath10k: add new cipher suite support")
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-current branch of ath.git, thanks.

307aeb31af0d ath10k: fix data rx for CCMP-256, GCMP and GCMP-256 in raw mode

-- 
https://patchwork.kernel.org/patch/10029097/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
