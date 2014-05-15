Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkssi-0005zk-KN
 for ath10k@lists.infradead.org; Thu, 15 May 2014 10:27:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFTv2 4/5] ath10k: wait for mgmt tx when flushing too
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-5-git-send-email-michal.kazior@tieto.com>
 <53727C12.2060100@candelatech.com>
 <CA+BoTQ=05fULptYqAecf-9jsq_aun_NsNT=c2-ZFxm96ymgQdg@mail.gmail.com>
Date: Thu, 15 May 2014 13:26:47 +0300
In-Reply-To: <CA+BoTQ=05fULptYqAecf-9jsq_aun_NsNT=c2-ZFxm96ymgQdg@mail.gmail.com>
 (Michal Kazior's message of "Thu, 15 May 2014 09:24:31 +0200")
Message-ID: <87vbt79w2g.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> In the meantime if you want to hasten tx queue ps expiration you can
> try to set `ap_detect_out_of_sync_sleeping_sta_time_secs` vdev param
> to 1 second (default is 10 set in firmware if I'm not mistaken). I
> haven't tested it but this should in theory shorten tx credit
> starvation duration and avoid cascade of wmi timeouts (wmi timeout=3
> seconds, max mgmt tx pending=2 x 1 second each=2s worst case) as well
> as should prevent tx flushing from failing (timeout=5). This will not
> prevent from beacon SWBA overruns because tx starvation is still
> possible although it should be faster to recover.
>
> I wonder if it's reasonable to set this vdev param explicitly in
> upstream driver. We should probably consider longest beacon interval
> in effect when calculation the value to set. Thoughts, anyone?

I haven't looked at the details yet but I think that would be a good
idea. Are there any downsides from doing that change?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
