Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YceGL-0002mg-IM
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 18:18:14 +0000
Received: by obbps3 with SMTP id ps3so19448675obb.3
 for <ath10k@lists.infradead.org>; Mon, 30 Mar 2015 11:17:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ego64nny.fsf@kamboji.qca.qualcomm.com>
References: <1427476680-5532-1-git-send-email-yanbol@qca.qualcomm.com>
 <87ego64nny.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 30 Mar 2015 11:17:51 -0700
Message-ID: <CAFuUQkhKrU0VDki49VLYoeppXJZXxU--v0kykfgUGZSr_ywgwA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Change the fw stats access mask
From: YanBo <dreamfly281@gmail.com>
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
Cc: Yanbo Li <yanbol@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Mon, Mar 30, 2015 at 6:31 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yanbo Li <yanbol@qca.qualcomm.com> writes:
>
>> This fix the regerssion introduced after "ath10k_wmi_requests_stats()
>> call to use more stat bits", both the 10.2.X FW and community FW 10.1.X
>> will return time out when access the fw_stats with the STAT_VDEV and
>> STAT_PDEV. Add the condition to use different fw_stats mask for different
>> FW versions.
>>
>> Fixes:7777d8c7ef6f("ath10k: implement fw stats for wmi-tlv")
>> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>
>
> There was a trivial conflict, please check my resolution in the pending
> branch.
>
Checked, looks well,  Thanks

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
