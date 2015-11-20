Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzopM-0004oe-3D
 for ath10k@lists.infradead.org; Fri, 20 Nov 2015 16:47:11 +0000
Subject: Re: QCA998X not working at all
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com> <564DF53C.50009@candelatech.com>
 <564E02F1.3090306@dd-wrt.com> <564E130D.4080201@dd-wrt.com>
 <87wptcsx8b.fsf@kamboji.qca.qualcomm.com> <564F428B.7050703@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <564F4E4A.106@candelatech.com>
Date: Fri, 20 Nov 2015 08:46:02 -0800
MIME-Version: 1.0
In-Reply-To: <564F428B.7050703@dd-wrt.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 11/20/2015 07:55 AM, Sebastian Gottschall wrote:
>
> the patch subjected with:  ath10k: use pre-allocated DMA buffer in Tx
> must be reverted.
> it will lead to out of memory when using multiple cards on ipq806x. it seems that there isnt enough dma buffer available on this platform
> reverting this patch will fix it

Maybe it can be re-implemented so that it uses the old behaviour
if the allocation fails.  That way, we can still get performance
improvement on systems that have the DMA buffer space available?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
