Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLjwe-0004Cg-Pb
 for ath10k@lists.infradead.org; Sun, 11 Nov 2018 07:14:10 +0000
From: <murugana@codeaurora.org>
References: <20181109061121.4184-1-murugana@codeaurora.org>
 <0d74b002-e36d-8169-34e8-59338eac6918@newmedia-net.de>
In-Reply-To: <0d74b002-e36d-8169-34e8-59338eac6918@newmedia-net.de>
Subject: RE: [EXTERNAL] Re: [PATCH] ath10k: Disable 4addr source port learning
 in 10.4 FW by default
Date: Sun, 11 Nov 2018 12:43:51 +0530
Message-ID: <00fd01d4798e$1c0d2f10$54278d30$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Sebastian Gottschall' <s.gottschall@newmedia-net.de>, 'Sathishkumar Muruganandam' <murugana@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi Sebastian,

> after tested 2 WDS devices (one WDS AP, one WDS STA) with 9984 (netgear
> r7800) i found out that the issue persists. gtk rekeying fails, so disconnect and
> reconnect after 60 minutes.

Are you using the latest FW 10.4-3.6.0.1-00003 for 9984 ( mainly on the AP side ) ?

(https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=a00e61b9203186561dc90de1ff7ed4d5f5e920d5)

Thanks,
Sathishkumar



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
