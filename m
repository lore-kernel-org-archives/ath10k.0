Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSSqt-0005Sx-VJ
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 17:42:40 +0000
Subject: Re: Coverage class on ath10k
References: <mailman.34731.1463383905.1639.ath10k@lists.infradead.org>
 <5798173A.50001@solectek.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5798F265.2010106@candelatech.com>
Date: Wed, 27 Jul 2016 10:41:57 -0700
MIME-Version: 1.0
In-Reply-To: <5798173A.50001@solectek.com>
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
To: Petar Vutov <pvutov@solectek.com>, ath10k@lists.infradead.org

On 07/26/2016 07:06 PM, Petar Vutov wrote:
> Hi All,
>
> Does anyone know how I can modify coverage class for ath10k?
>
> It looks like that command  'iw phy0 set distance <meters>' doesn't get to the firmware on QCA98XX due to missing function set_coverage_class.
>
> Is there any other way to manipulate ack timeout and slot time on the firmware?

It requires some small tweaks to the firmware, or something like the huge hack
that was just posted to the ath10k mailing list.

Thanks,
Ben

>
> Thanks,
>
> Petar Vutov
> Director of Software Engineering
> Solectek Corp.
> 8969 Kenamar Drive, Suite 113
> San Diego, CA 92121
> 1-858-450-1220 Ext 3008
> www.solectek.com
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
