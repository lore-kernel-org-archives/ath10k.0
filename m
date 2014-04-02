Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVFkf-00038m-If
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 07:38:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove not needed warning when peer unmap
References: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Wed, 2 Apr 2014 10:37:58 +0300
In-Reply-To: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 1 Apr 2014 10:23:48 +0200")
Message-ID: <87vbusqizt.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Remove not needed warning when get peer unmap
> event from the firmware. This is not critical
> message. Instead print this as a debug message.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

This one has a new checkpatch warning:

drivers/net/wireless/ath/ath10k/txrx.c:204: CHECK: Alignment should match open parenthesis

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
