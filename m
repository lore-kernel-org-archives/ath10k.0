Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNFHj-0006P4-88
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 06:03:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: add testmode
References: <20140828072642.14691.44313.stgit@potku.adurom.net>
 <20140828073041.14691.15099.stgit@potku.adurom.net>
 <878um9ujn1.fsf@kamboji.qca.qualcomm.com>
 <53FEFEDE.5030505@broadcom.com>
Date: Fri, 29 Aug 2014 09:03:09 +0300
In-Reply-To: <53FEFEDE.5030505@broadcom.com> (Arend van Spriel's message of
 "Thu, 28 Aug 2014 12:05:18 +0200")
Message-ID: <87y4u7suhu.fsf@kamboji.qca.qualcomm.com>
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
To: Arend van Spriel <arend@broadcom.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Arend van Spriel <arend@broadcom.com> writes:

> On 08/28/14 10:02, Kalle Valo wrote:
>> Kalle Valo<kvalo@qca.qualcomm.com>  writes:
>
>> Johannes suggested to put this to a separate file as that way it's
>> easier for the user space. In v3 I'm planning to create testmode_uapi.h
>> for this.
>
> I suppose that file will/should end up in include/uapi/...

I was thinking not to put this to the include directory. This is just a
testmode interface used only by few people, not a proper driver
interface.

> so wouldn't it be better to call it ath10k_testmode.h?

We already have testmode.h so having ath10k_testmode.h in the same
directory would be confusing. Would testmode_i.h be any better?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
