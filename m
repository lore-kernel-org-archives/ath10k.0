Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOQSH-0000Sp-1w
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 11:39:14 +0000
Received: by mail-lb0-f172.google.com with SMTP id c11so1701810lbj.3
 for <ath10k@lists.infradead.org>; Fri, 14 Mar 2014 04:38:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bnx983oh.fsf@kamboji.qca.qualcomm.com>
References: <20140313082431.10798.10888.stgit@potku.adurom.net>
 <87bnx983oh.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 14 Mar 2014 12:38:48 +0100
Message-ID: <CADnKcVjjpes6uMM8pwwPKrqLfduYYYRvh2EAW4D2_RWv4zxDRA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: add soft/hard firmware crash option to
 simulate_fw_crash
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

Hi Kalle,

On 14 March 2014 11:39, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Hi Marek,
>
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>
>> From: Marek Puzyniak <marek.puzyniak@tieto.com>
>>
>> Command WMI_FORCE_FW_HANG_CMDID is not supported in firmware 10.1.
>> In order to have firmware crash simulation functionality also
>> in firmware 10.1 driver can force firmware crash by performing not allowed
>> operation. Driver can deliberately crash firmware when setting vdev param for
>> vdev id out of range.  This patch introduces two keywords to simulate_fw_crash:

[...]

> can you please review my changes and check if they are ok?

Looks fine.

Thank you,
Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
