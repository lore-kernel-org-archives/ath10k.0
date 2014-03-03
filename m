Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKNQ8-0005Ry-Ap
 for ath10k@lists.infradead.org; Mon, 03 Mar 2014 07:36:17 +0000
Received: by mail-wg0-f41.google.com with SMTP id l18so2687872wgh.0
 for <ath10k@lists.infradead.org>; Sun, 02 Mar 2014 23:35:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5310CB75.9030706@candelatech.com>
References: <1393571908-23734-1-git-send-email-marek.kwaczynski@tieto.com>
 <5310CB75.9030706@candelatech.com>
Date: Mon, 3 Mar 2014 08:35:49 +0100
Message-ID: <CACKGw+EQ4xS6DTbM_FjMitvyQs9=uL5OFzPkc6HNuzu8tSdeUQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add recalc RTS/CTS protection method
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 28 February 2014 18:46, Ben Greear <greearb@candelatech.com> wrote:
> On 02/27/2014 11:18 PM, bartosz.markowski@tieto.com wrote:
>> From: Marek Kwaczynski <marek.kwaczynski@tieto.com>
>>
>> Add recalculation of RTS/CTS protection when one or more legacy
>> stations are connected to ath10k. In this case enable RTS/CTS
>> protection and set sw retry profile are needed in the FW.
>> Without this change legacy station is starved and has very low
>> throughput.
>
>> -                     ath10k_warn("Failed to set CTS prot for VDEV: %d\n",
>> -                                 arvif->vdev_id);
>> +                     ath10k_warn("failed to recalc RTS/CTS prot %d\n",
>> +                                 ret);
>
> Did you remove the vdev ID from the logging message on purpose?
>
> I find having vdev ID in logging messages helps, especially when
> trying to compare firmware logs with the driver logs...

Not on purpose. Thanks for pointing it out.
Kalle, please ignore this patch, there'll be v2.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
