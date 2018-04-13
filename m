Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve1eur01on0078.outbound.protection.outlook.com
 ([104.47.1.78] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6oME-0003bn-LW
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 02:22:36 +0000
Subject: Re: [PATCH v2] ath10k: Implement get_expected_throughput callback
References: <1521814034-17880-1-git-send-email-akolli@codeaurora.org>
 <2322769.sx4MhzsvNg@bentobox>
 <7428dc3685e146dca147805b6a1bc5d2@codeaurora.org>
 <1580002.5HauTVtcdp@bentobox>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <75b3a88c-518f-f464-df1d-7c1cd8e54b89@bowerswilkins.com>
Date: Thu, 12 Apr 2018 19:22:05 -0700
MIME-Version: 1.0
In-Reply-To: <1580002.5HauTVtcdp@bentobox>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, akolli@codeaurora.org
Cc: Marek Lindner <mareklindner@neomailbox.ch>, Johannes Berg <johannes.berg@intel.com>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Antonio Quartulli <a@unstable.cc>, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

Hi Anilkumar,


On 03/27/2018 11:37 PM, Sven Eckelmann wrote:
> On Mittwoch, 28. M=E4rz 2018 11:41:51 CEST akolli@codeaurora.org wrote:
> [...]
>> The rate average and throughput are relative. no?
Can you share the output number from your new function?
It may help us to understand a little bit more how well the new function =

works.

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
