Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQ8XX-0005sN-UU
 for ath10k@lists.infradead.org; Thu, 21 Jul 2016 07:37:05 +0000
Received: by mail-it0-x241.google.com with SMTP id d65so697343ith.0
 for <ath10k@lists.infradead.org>; Thu, 21 Jul 2016 00:36:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160721070938.GA2658@redhat.com>
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
From: Emmanuel Grumbach <egrumbach@gmail.com>
Date: Thu, 21 Jul 2016 10:36:42 +0300
Message-ID: <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
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
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Thu, Jul 21, 2016 at 10:09 AM, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
> On Tue, Jul 19, 2016 at 03:00:37PM +0200, Michal Kazior wrote:
>> Firmware files are versioned to prevent older
>> driver instances to load unsupported firmware
>> blobs. This is reflected with a fallback logic
>> which attempts to load several firmware files.
>>
>> This however produced a lot of unnecessary
>> warnings sometimes confusing users and leading
>> them to rename firmware files making things even
>> more confusing.
>
> This happens on kernels configured with
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK and cause not only ugly warnings,
> but also 60 seconds delay before loading next firmware version.
> For some reason RHEL kernel needs above config option, so this
> patch is very welcome from my perspective.
>

Sorry for my ignorance but how does the firmware loading work if not
with udev's help? As you can imagine, iwlwifi is suffering from the
same problem and I would be interested in applying the same change,
but I'd love to understand a bit more :)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
