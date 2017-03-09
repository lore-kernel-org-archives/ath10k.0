Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clx9N-0006pa-6J
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 12:26:35 +0000
Message-ID: <58C14C2D.902@candelatech.com>
Date: Thu, 09 Mar 2017 04:35:57 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Please update board-2.bin for QCA9888
References: <7312b473-4dec-5fec-8642-8233689f4d8a@candelatech.com>
 <87lgse6hmf.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lgse6hmf.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/08/2017 11:21 PM, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Newer 9886 (which use the 9888 firmware it seems) NICs will not
>> boot unless you use the board-2.bin from the codeaura repo.
>>
>> Kalle:  Could you update your repo to the latest from codeaura so that it is
>> easy to pull the latest board file into LEDE?
>>
>> If you have reason not to, please let me know.
>
> I'm not involved with codeaurora repositories so I don't know what file
> you are talking about. What's the URL?
>

git://codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware

[greearb@ben-dt3 ath10k-firmware]$ ls -l ath10k/QCA9888/hw2.0/board-2.bin
-rw-rw-r--. 1 greearb greearb 60660 Mar  2 16:20 ath10k/QCA9888/hw2.0/board-2.bin

[greearb@ben-dt3 ath10k-firmware]$ md5sum ath10k/QCA9888/hw2.0/board-2.bin
4fffcdf246cea4a4fd5ba67730262563  ath10k/QCA9888/hw2.0/board-2.bin

I actually tested an older version of that file, but I assume the more recent one works
fine too.  I don't have a 9886/8 system available for testing at the moment.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
