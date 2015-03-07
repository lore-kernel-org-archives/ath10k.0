Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU9VF-0000jF-Jb
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 07:50:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: update MODULE_FIRMWARE definitions for QCA6174
References: <1424261797-9474-1-git-send-email-bartosz.markowski@tieto.com>
Date: Sat, 7 Mar 2015 09:49:59 +0200
In-Reply-To: <1424261797-9474-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 18 Feb 2015 13:16:37 +0100")
Message-ID: <87ioed1c2g.fsf@kamboji.qca.qualcomm.com>
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

> This has been missed while adding the QCA6174 support.
> As in the last time, without advertising the firmware files
> as needed (or optional) for ath10k, these won't be built into
> ram disk for instance.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
