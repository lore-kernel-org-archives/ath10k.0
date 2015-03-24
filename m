Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaJLS-00023W-AS
 for ath10k@lists.infradead.org; Tue, 24 Mar 2015 07:33:51 +0000
Received: by iedfl3 with SMTP id fl3so61882527ied.1
 for <ath10k@lists.infradead.org>; Tue, 24 Mar 2015 00:33:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87pp7zd81d.fsf@kamboji.qca.qualcomm.com>
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-6-git-send-email-marek.puzyniak@tieto.com>
 <87pp7zd81d.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 24 Mar 2015 03:33:28 -0400
Message-ID: <CADnKcVizKNOJwhc9a=XfPUZfEM3V+QJ59sK0oorWK-b3jeKRyA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] ath10k: add wmi support for tdls
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 23 March 2015 at 11:53, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Marek Puzyniak <marek.puzyniak@tieto.com> writes:
>
>> As a part of tdls implementation introduce
>> tdls related wmi data structures, constant
>> values and functions.
>>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> This patch had non-trivial conflicts, please check carefully my
> resolution in the pending branch.
>
>   CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi.h
>   CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.h
>   CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.c
>   CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-ops.h
>
> --
> Kalle Valo

It looks OK, but there is one small thing in file
drivers/net/wireless/ath/ath10k/wmi-tlv.c.
There are two new lines between functions ath10k_wmi_tlv_op_gen_tdls_peer_update
and ath10k_wmi_tlv_op_gen_wow_enable.

Thanks,
Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
