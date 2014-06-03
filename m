Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WriqK-00050j-AX
 for ath10k@lists.infradead.org; Tue, 03 Jun 2014 07:09:10 +0000
Message-ID: <538D7542.2070007@stackframe.org>
Date: Tue, 03 Jun 2014 09:12:02 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/2] ath10k: testmode support
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <538B8446.50301@stackframe.org> <87iooj1fds.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87iooj1fds.fsf@kamboji.qca.qualcomm.com>
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
To: kvalo@qca.qualcomm.com
Cc: ath10k@lists.infradead.org

Hi Kalle,

On 06/02/2014 05:48 PM, Kalle Valo wrote:
> Sven Schnelle <svens@stackframe.org> writes:
>
>> Only one small thing: The firmware expects the UTF commands in
>> segmented format. Should that splitting be done in your testmode
>> patch, or should userspace handle that?
> I would prefer to keep the driver as simple as possible. My idea here is
> that the testmode interface is only about tranmitting and receiving WMI
> packets, it does not look at all what's inside the packet. AFAIK the
> user space should be able to handle everything on it's own.
>
Ok, that's fine with me. I'm doing the fragmation in userspace already,
just wanted to mention that.

Thanks
Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
