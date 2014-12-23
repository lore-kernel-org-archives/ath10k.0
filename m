Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3VVS-0004br-3E
 for ath10k@lists.infradead.org; Tue, 23 Dec 2014 19:52:35 +0000
Message-ID: <5499C7ED.2020404@dd-wrt.com>
Date: Tue, 23 Dec 2014 20:52:13 +0100
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
MIME-Version: 1.0
References: <20141217101755.15964.2625.stgit@potku.adurom.net>	<20141217102226.15964.32919.stgit@potku.adurom.net>	<5491D20F.2020202@dd-wrt.com>
 <87tx0mcled.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87tx0mcled.fsf@kamboji.qca.qualcomm.com>
Subject: Re: [PATCH v2 8/8] ath10k: add thermal sensor device support
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Am 23.12.2014 um 18:43 schrieb Kalle Valo:
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> the whole code will not work. the firmware 10.2.4 returns op_version 3
>> so this check here fails
>>
>> if (ar->wmi.op_version != ATH10K_FW_WMI_OP_VERSION_10_2_4)
>>
>> since 5 is required
> I know, I used firmware-4.bin_10.2.4.13-2 to test this. I just didn't
> have a chance to upload it until now:
>
> https://github.com/kvalo/ath10k-firmware/tree/master/10.2.4
:-) thanks
i tested it using a hardcoded api version patch based on the firmware 
version  and it worked as well so far. (just tested temperture sensor 
readout)

Sebastian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
