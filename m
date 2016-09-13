Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjmtg-0003b4-Kc
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:33:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv3,1/5] ath10k: Move ath10k_hw_params definition to hw.h
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160829144557.11678-2-benjamin@sipsolutions.net>
Message-ID: <d3a8c2a8579a47568bcff1e1414ed06e@euamsexm01a.eu.qualcomm.com>
Date: Tue, 13 Sep 2016 14:32:41 +0200
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
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Benjamin Berg <benjamin@sipsolutions.net> wrote:
> From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
> 
> This is to prepare for rx descriptor abstraction where we'll
> be dereferencing ath10k_hw_params member in hw.h. Moreover
> hw.h looks more suitable to house ath10k_hw_params definition
> than core.h
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, 4 patches applied to ath-next branch of ath.git:

43d923e2c192 ath10k: move ath10k_hw_params definition to hw.h
ae02c8719aab ath10k: add provision for Rx descriptor abstraction
9e19e1326142 ath10k: properly remove padding from the start of rx payload
95b5bf7ccca0 ath10k: remove 4-addr padding related hw_param configuration

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9304059/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
