Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e71lA-0002Ln-1L
 for ath10k@lists.infradead.org; Tue, 24 Oct 2017 16:08:57 +0000
Message-ID: <59EF65AE.8060803@candelatech.com>
Date: Tue, 24 Oct 2017 09:09:18 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
 <87376dds5e.fsf@kamboji.qca.qualcomm.com>
 <9407ed1f-2bd9-3fd0-981d-1a20452e8ba9@dd-wrt.com>
 <CAGyitvNj+74HafQ9Aps1HTmknTxa0ZUgV7hao1A8mJ4rV7cibw@mail.gmail.com>
 <8760b5cfnz.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8760b5cfnz.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Jasmine Strong <jas@eero.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On 10/23/2017 09:50 PM, Kalle Valo wrote:
> Jasmine Strong <jas@eero.com> writes:
>
>> That's what I saw.  A bcom client was able to associate and not pass
>> any traffic.  This is on all three of 9882, 9888 and 4019.
>
> Thanks for the report, we'll investigate it. And I see that your email
> was now succesfully delivered to the list:
>
> http://lists.infradead.org/pipermail/ath10k/2017-October/010325.html


I'm not sure if this is helpful or not, but in the transition from 10.1 to 10.2 firmware,
there was some tricky re-work of the PN counter logic in the firmware source.  It had
specific impact on the broadcom driver interaction.

Possibly a similar issue is being seen with this driver patch?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
