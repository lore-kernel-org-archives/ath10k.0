Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtIt8-0005sq-Cj
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 16:22:50 +0000
Message-ID: <5474ACBF.7090905@candelatech.com>
Date: Tue, 25 Nov 2014 08:22:23 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: move create-ht-cap methods above set-antenna.
References: <1411576506-11815-1-git-send-email-greearb@candelatech.com>
 <874mtn3dof.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874mtn3dof.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 11/25/2014 12:08 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> We will need to use these in set-antenna, so move them
>> so that we do not have to define the method signatures.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> I'm dropping these two patches. Please resend once we figure out how to
> handle the band updated.

It might be a while...I'm working on some other tasks these days
and don't have time to respin ath10k patches at the moment.

If someone else wants to work on getting them upstream, please be
my guest.

Per Felix's comment, maybe my patches were actually OK as they are....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
