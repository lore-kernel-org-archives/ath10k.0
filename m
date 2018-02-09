Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejxU3-0005x8-Qu
 for ath10k@lists.infradead.org; Fri, 09 Feb 2018 01:28:13 +0000
Received: by mail-wm0-x233.google.com with SMTP id r71so12742687wmd.1
 for <ath10k@lists.infradead.org>; Thu, 08 Feb 2018 17:28:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <37194F02-EB5E-4E01-87B2-EFBA8721E7EC@fb.com>
References: <8B7D031B-8228-493D-8B2C-963C76850F4A@fb.com>
 <CAJ-VmokrWbwyH7O=jNRthpWRPicRV6=O_OC+Zg8rn5jVTUAhPw@mail.gmail.com>
 <37194F02-EB5E-4E01-87B2-EFBA8721E7EC@fb.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 8 Feb 2018 17:27:58 -0800
Message-ID: <CAJ-Vmom3+MXxKe2q=PC7zH9CRhu6JPW5qvt8SNQj7TK-3SwbDg@mail.gmail.com>
Subject: Re: Frames acknowledged and silently discarded in firmware
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
To: Javier Cardona <jcardona@fb.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Yeah, it's possible it's being dropped in the HTT notification path -
the hardware afaik is doing the ACKing there.

I think pktlog is the primary way I'd try to debug this but yeah,
there's no open pktlog tool iirc for even just looking at the packet
data..



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
