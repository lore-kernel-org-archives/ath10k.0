Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPSJk-0002H2-Re
 for ath10k@lists.infradead.org; Mon, 17 Mar 2014 07:50:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Proper way to do warm-reset from the driver?
References: <53237D0A.1030008@candelatech.com>
Date: Mon, 17 Mar 2014 09:50:06 +0200
In-Reply-To: <53237D0A.1030008@candelatech.com> (Ben Greear's message of "Fri, 
 14 Mar 2014 15:04:58 -0700")
Message-ID: <87r461l0wh.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On my firmware, I am often seeing 'tx not flushed' errors after bouncing
> 32 stations a few times.
>
> It does not seem this error can ever be recovered because the
> reference counting is messed up.
>
> I am planning to attempt a warm reset in this case, in hopes it
> will clear things up.
>
> Is the preferred way to restart the nic just:
>
> queue_work(ar->workqueue, &ar->restart_work);

BTW, that call really should not be in ath10k_pci_hif_dump_area(). It's
very misleading to have a function name which implies just printing
stuff but actually also restarts firmware.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
