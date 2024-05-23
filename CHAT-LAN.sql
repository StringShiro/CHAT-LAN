--create database Database1;
--go

--use Database1;
--go

CREATE TABLE [dbo].[contacts] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [contactname] NVARCHAR (MAX) NULL,
    [photo]       IMAGE          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[conversations] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [ContactName]       NVARCHAR (50)  NOT NULL,
    [LastOnline]        NCHAR (10)     NULL,
    [ReceivedMsgs]      NVARCHAR (MAX) NULL,
    [MsgReceivedOn]     DATETIME       NULL,
    [IsReplied]         BIT            NULL,
    [IsRead]            BIT            NULL,
    [SentMsgs]          NVARCHAR (MAX) NULL,
    [MsgSentOn]         DATETIME       NULL,
    [DocumentsReceived] NVARCHAR (MAX) NULL,
    [DocumentsSent]     NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[userAccount] (
    [userID]   INT            NOT NULL,
    [userName] NVARCHAR (50)  NOT NULL,
    [userPass] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([userID] ASC)
);

CREATE TABLE [dbo].[UserChannel] (
    [userName]  NVARCHAR (50)  NOT NULL,
    [channelID] NVARCHAR (MAX) NOT NULL
);

CREATE TABLE [dbo].[Channel] (
    [channelID] NVARCHAR (MAX) NOT NULL,
    [users]     NVARCHAR (1)   DEFAULT (NULL) NULL
);

--fill table conversastions
SET IDENTITY_INSERT [dbo].[conversations] ON
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (1, N'Steve', N'Today     ', N'Hey, what’s up?', N'2020-09-07 10:00:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (7, N'Steve', N'Today     ', NULL, NULL, NULL, NULL, N'Everything is going smooth. What about you?', N'2020-09-07 10:05:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (11, N'Steve', NULL, N'Same here. What’s your plan for this weekend?', N'2020-09-07 10:06:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (12, N'Steve', NULL, NULL, NULL, NULL, NULL, N'Nothing much. Do you have something in mind?', N'2020-09-07 10:07:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (13, N'Steve', NULL, N'I’ve been thinking about going out on a picnic since the last weekend. What do you say?', N'2020-09-07 10:08:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (14, N'Steve', NULL, NULL, NULL, NULL, NULL, N'Not a bad idea. I’m up for it. Even I’ve been tired of loitering around malls and movie theaters on the weekends. Outdoors would be great. Do you’ve a location in mind?', N'2020-09-07 10:09:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (15, N'Steve', NULL, N'How about Tava? It’s relatively remote and just three-hour drive. We can in fact stay a night there in the government guest house maintained by the forest department.', N'2020-09-07 10:10:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (16, N'Steve', NULL, NULL, NULL, NULL, NULL, N'Can you tell more about the place? What activities we can take to there?', N'2020-09-07 10:11:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (17, N'Steve', NULL, N'The guest house is located on a small hillock overlooking the backwaters of a dam. It’s picturesque. We can make the guest house our base and undertake different activities in the surrounding area.', N'2020-09-07 10:12:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (18, N'Steve', NULL, NULL, NULL, NULL, NULL, N'The location sounds exciting.', N'2020-09-07 10:13:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (19, N'Steve', NULL, N'We can hike down from the guest house to the backwater in an hour or so, spend some time there, then walk on a different trail, and then finally walk back up to the guest house in the evening. We can also take boat ride on the backwater, but for that we’ll have to walk 2-3 kilometers, which isn’t a big deal. There is forest all around that area, and on the next day we can loiter around. You’ll get perfect solitude in the area.', N'2020-09-07 10:14:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (20, N'Steve', NULL, NULL, NULL, NULL, NULL, N'Can we cook own food? Because that’s a key ingredient of any picnic.', N'2020-09-07 10:15:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (22, N'Steve', NULL, N'I’m not sure about it. We can carry the raw material, but we can get confirmation only when we reach there.', N'2020-09-07 10:16:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (23, N'Steve', NULL, NULL, NULL, NULL, NULL, N'OK.', N'2020-09-07 10:17:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (24, N'Steve', NULL, N'I forgot to mention that we can even play volleyball or cricket close to the bank of the backwater, which has a sandy beach.', N'2020-09-07 10:18:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (25, N'Steve', NULL, NULL, NULL, NULL, NULL, N'Sandy beach, wow!', N'2020-09-07 10:19:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (26, N'Steve', NULL, N'It’s not like what you’ll get on a coastline, but it’s awesome considering the fact that it’s so close to us. OK, so what’s the plan?', N'2020-09-07 10:20:00', NULL, NULL, N'', NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (27, N'Steve', NULL, N'', NULL, NULL, NULL, N'I’m definitely in. Let’s ask few more friends. We should aim for 5-6.', N'2020-09-07 10:21:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (28, N'Steve', NULL, N'Agree. Once we’ve people in, we can pool in different resources – food, vehicle, and other items.', N'2020-09-07 10:22:00', NULL, NULL, N'', NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (29, N'Steve', NULL, N'', NULL, NULL, NULL, N'Let’s speak to others today and get the final consent by tomorrow.', N'2020-09-07 10:23:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (30, N'Steve', NULL, N'Sounds good.', N'2020-09-07 10:24:00', NULL, NULL, N'', NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (33, N'Mike', NULL, N'The paper was long, wasn’t it?', N'2020-09-08 11:15:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (34, N'Mike', NULL, NULL, NULL, NULL, NULL, N'Yes, unusually long. For sure, we won’t see as many 95+ marks in English this year.', N'2020-09-08 11:20:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (35, N'Mike', NULL, N'How did you do?', N'2020-09-08 11:25:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (37, N'Mike', NULL, NULL, NULL, NULL, NULL, N'So. So. I wish I had timed myself better. In the end, I left questions worth 10 marks unattempted. How about you?', N'2020-09-08 11:30:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (38, N'Mike', NULL, N'I started off well. I was in fact ahead of time as long as I was on grammar and letter writing, but this year’s reading comprehension passages were just too tough for me, and it completely derailed my time management.', N'2020-09-08 11:35:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (39, N'Mike', NULL, NULL, NULL, NULL, NULL, N'So, did you too fail to complete the paper?', N'2020-09-08 11:36:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (40, N'Mike', NULL, N' I did somehow manage to complete, but in the last 20-odd minutes I had to hurry so much that I guess I made quite a few mistakes. Which parts in the paper did you find particularly challenging?', N'2020-09-08 11:37:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (41, N'Mike', NULL, NULL, NULL, NULL, NULL, N'Well, English has never been my forte, and I found even parts of grammar to be challenging, besides the usual culprit – reading comprehension.', N'2020-09-08 11:40:00', NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (42, N'Mike', NULL, N'(Sighs) Well, can’t do much now. Let’s hope for the best and get ready for the next one, chemistry.', N'2020-09-08 11:42:00', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[conversations] ([Id], [ContactName], [LastOnline], [ReceivedMsgs], [MsgReceivedOn], [IsReplied], [IsRead], [SentMsgs], [MsgSentOn], [DocumentsReceived], [DocumentsSent]) VALUES (43, N'Mike', NULL, NULL, NULL, NULL, NULL, N'You’re right. Let’s get back to studies. Few more hard days to go.', N'2020-09-08 12:00:00', NULL, NULL)
SET IDENTITY_INSERT [dbo].[conversations] OFF


SET IDENTITY_INSERT [dbo].[contacts] ON
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (1, N'Mike')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (2, N'John')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (3, N'Will')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (4, N'Steve')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (5, N'Rohit')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (6, N'Liam')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (7, N'Noah')
INSERT INTO [dbo].[contacts] ([Id], [contactname]) VALUES (8, N'Oliver')
SET IDENTITY_INSERT [dbo].[contacts] OFF